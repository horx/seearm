# coding: utf-8
require 'digest/md5'
module ProductsHelper
  def format_product_body(text)
    MarkdownProductConverter.format(text)
  end

end