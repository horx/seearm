class Position < ActiveRecord::Base
  attr_accessible :title, :desc, :image, :url, :location
end
