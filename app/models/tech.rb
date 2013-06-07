class Tech < ActiveRecord::Base
  attr_accessible :name, :content, :category_id
  belongs_to :category
  default_scope order:  'id desc'
end
