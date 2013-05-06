# coding: utf-8
class ImageUploader < BaseUploader
  def store_dir
    "images/"
  end
  process :resize_to_limit => [720, nil]
end