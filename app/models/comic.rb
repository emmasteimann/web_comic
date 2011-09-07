class Comic < ActiveRecord::Base
  has_many :comments
  
  storage_loc = "#{Rails.root}/config/s3.yml"
  storage_path = "comic_:id.:extension"
  bucket = "SAR_comic"
  
  puts storage_loc
  
  has_attached_file :image,
    :storage => :s3,
    :s3_credentials => storage_loc,
    :path => storage_path,
    :bucket => bucket

  def previous(offset = 0)    
    self.class.first(:conditions => ['id < ?', self.id], :limit => 1, :offset => offset, :order => "id DESC")
  end

  def next(offset = 0)
    self.class.first(:conditions => ['id > ?', self.id], :limit => 1, :offset => offset, :order => "id ASC")
  end
end
  