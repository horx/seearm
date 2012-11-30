class Product < ActiveRecord::Base
  attr_accessible :category, :content, :keywords, :name, :price, :status
end
