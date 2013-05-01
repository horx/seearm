class UploadFile < ActiveRecord::Base
  attr_accessible :file_name, :user_id
  mount_uploader :file_name, ImageUploader
end
