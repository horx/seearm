class Category < ActiveRecord::Base
  attr_accessible :desc, :name, :slug, :parent_id
  validates_presence_of :name, :slug, :desc
  validates_uniqueness_of :name, :slug

  acts_as_tree

  default_scope order:  'id desc'

  has_many :products
  has_many :products
  has_many :pages
  has_many :news
  has_many :guides
  has_many :teches

end