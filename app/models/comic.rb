class Comic < ActiveRecord::Base
  has_many :comments
  
  storage_path = "comic_:id.:extension"
  bucket = "SAR_comic"
  
  #puts storage_loc
  
  has_attached_file :image,
    :storage => :s3,
    :s3_credentials => {
      :access_key_id => ENV['S3_KEY'],
      :secret_access_key => ENV['S3_SECRET']
    },
    :path => storage_path,
    :bucket => bucket

  def previous(offset = 0)    
    self.class.first(:conditions => ['post_date < ? AND post_date <= ? AND disabled = ?', self.post_date, Time.now, false], :limit => 1, :offset => offset, :order => "created_at DESC")
  end
  def next(offset = 0)
    self.class.first(:conditions => ['post_date > ? AND post_date <= ? AND disabled = ?', self.post_date, Time.now, false], :limit => 1, :offset => offset, :order => "created_at ASC")
  end
  scope :recent, :limit => 1, :order => 'created_at DESC', :conditions => ['post_date <= ? AND disabled = ?', Time.now, false]
  scope :initial, :limit => 1, :order => 'created_at ASC', :conditions => ['post_date <= ? AND disabled = ?', Time.now, false]
  
  scope :current_year, lambda {
    where("post_date >= ? AND post_date <= ?", DateTime.strptime( Time.now.year.to_s + "/01/01", "%Y/%m/%d").to_time, DateTime.strptime( Time.now.year.to_s + "/12/31", "%Y/%m/%d").to_time)
  }
  scope :by_year, lambda { |your_year|
    where("post_date >= ? AND post_date <= ?", DateTime.strptime( your_year + "/01/01", "%Y/%m/%d").to_time, DateTime.strptime( your_year + "/12/31", "%Y/%m/%d").to_time)
  }
end
  