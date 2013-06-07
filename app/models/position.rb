class Position < ActiveRecord::Base
  attr_accessible :title, :desc, :image, :url, :location
  default_scope order:  'id desc'
end
