class Page < ActiveRecord::Base
  attr_accessible :content, :name, :slug, :category_id
  validates_presence_of :name, :slug, :content
  validates_uniqueness_of :name, :slug

  belongs_to :category
end
