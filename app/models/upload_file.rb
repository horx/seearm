class UploadFile < ActiveRecord::Base
  attr_accessible :file_name, :user_id
  default_scope order:  'id desc'
  mount_uploader :file_name, ImageUploader
end
