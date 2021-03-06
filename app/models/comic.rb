class Comic < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged
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
    if Rails.env.development?
      self.class.first(:conditions => ['post_date > ? AND post_date <= ? AND disabled = ?', self.post_date, Time.now, false], :limit => 1, :offset => offset+1, :order => "created_at ASC")
    else
      self.class.first(:conditions => ['post_date > ? AND post_date <= ? AND disabled = ?', self.post_date, Time.now, false], :limit => 1, :offset => offset, :order => "created_at ASC")
    end
  end
  scope :keep_site_alive, lambda {  puts 'Keep Site Alive!' }
  scope :all_viewable_comics, lambda {  where("disabled = ?", false) }

  scope :recent, :limit => 1, :order => 'created_at DESC', :conditions => ['post_date <= ? AND disabled = ?', Time.now, false]
  scope :initial, :limit => 1, :order => 'created_at ASC', :conditions => ['post_date <= ? AND disabled = ?', Time.now, false]

  scope :current_year, lambda {
    where("post_date >= ? AND post_date <= ? AND disabled = ?", DateTime.strptime( Time.now.year.to_s + "/01/01", "%Y/%m/%d").to_time, DateTime.strptime( Time.now.year.to_s + "/12/31", "%Y/%m/%d").to_time, false)
  }
  scope :by_year, lambda { |your_year|
    where("post_date >= ? AND post_date <= ? AND disabled = ?", DateTime.strptime( your_year + "/01/01", "%Y/%m/%d").to_time, DateTime.strptime( your_year + "/12/31", "%Y/%m/%d").to_time, false)
  }
  scope :between, lambda { |from,to|
    where("post_date > ? AND post_date <= ? AND disabled = ?", DateTime.strptime( from.to_s() + "/01/01", "%Y/%m/%d").to_time, DateTime.strptime( to.to_s() + "/12/31", "%Y/%m/%d").to_time, false)
  }
end
