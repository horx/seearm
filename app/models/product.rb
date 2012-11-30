class Product < ActiveRecord::Base
  attr_accessible :category_id, :content, :keywords, :name, :price, :status

  belongs_to :category
end
