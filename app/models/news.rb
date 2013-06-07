class News < ActiveRecord::Base
  attr_accessible :name, :content, :category_id
  belongs_to :category
end
