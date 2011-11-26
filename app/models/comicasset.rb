class ComicAsset < ActiveRecord::Base

  storage_path = "asset_:id.:extension"
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
    
end
