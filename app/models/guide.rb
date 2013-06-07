class Guide < ActiveRecord::Base
  attr_accessible :name, :content, :category_id, :file
  belongs_to :category
end
