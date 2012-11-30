class Product < ActiveRecord::Base
  attr_accessible :category, :content, :keywords, :name, :price, :status

  belongs_to :category
end
