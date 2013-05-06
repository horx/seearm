# coding: utf-8
class ContentImageUploader < Imageploader


  process :resize_to_limit => [720, nil]
end