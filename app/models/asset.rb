class Asset < ActiveRecord::Base
  
  storage_loc = "#{Rails.root}/config/s3.yml"
  storage_path = "asset_:id.:extension"
  bucket = "SAR_comic"
  
  #puts storage_loc
  
  has_attached_file :image,
    :storage => :s3,
    :s3_credentials => storage_loc,
    :path => storage_path,
    :bucket => bucket
    
end
