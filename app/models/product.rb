class Product < ActiveRecord::Base
  attr_accessible :category_id, :content, :keywords, :name, :price, :status, :pictures
  belongs_to :category
  mount_uploader :pictures, ImageUploader
end
