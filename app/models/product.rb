class Product < ActiveRecord::Base
  attr_accessible :category_id, :content, :keywords, :name, :price, :status, :pictures
  belongs_to :category

  default_scope order:  'id desc'

#  extend HasHtmlPipeline
#  has_html_pipeline :content, :markdown
  mount_uploader :pictures, LogoUploader
end
