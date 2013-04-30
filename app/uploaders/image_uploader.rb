# coding: utf-8
class ImageUploader < BaseUploader
  process :resize_to_limit => [720, nil]
end