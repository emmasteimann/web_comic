class Comic < ActiveRecord::Base
  has_many :comments
  
  storage_loc = "#{Rails.root}/config/s3.yml"
  storage_path = "comic_:id.:extension"
  bucket = "SAR_comic"
  
  #puts storage_loc
  
  has_attached_file :image,
    :storage => :s3,
    :s3_credentials => storage_loc,
    :path => storage_path,
    :bucket => bucket

  def previous(offset = 0)    
    self.class.first(:conditions => ['created_at < ? AND post_date <= ?', self.created_at, Time.now], :limit => 1, :offset => offset, :order => "created_at DESC")
  end
  def next(offset = 0)
    self.class.first(:conditions => ['created_at > ? AND post_date <= ?', self.created_at, Time.now], :limit => 1, :offset => offset, :order => "created_at ASC")
  end
    
  #scope :prevc, lambda { |current| {:conditions => ['created_at < ? AND post_date <= ?', current, Time.now], :limit => 1, :offset => 1, :order => "created_at DESC"} }
  #scope :nextc, lambda { |current| {:conditions => ['created_at > ? AND post_date <= ?', current, Time.now], :limit => 1, :offset => 1, :order => "created_at"} }
end
  