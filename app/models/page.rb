class Page < ActiveRecord::Base
  attr_accessible :content, :name, :slug
  validates_presence_of :name, :slug, :content
  validates_uniqueness_of :name, :slug
end
