# coding: utf-8
class LogoUploader < BaseUploader
  version :normal do
    process :resize_to_fill => [240, 240]
  end

  version :small do
    process :resize_to_fill => [320, 320]
  end

  version :large do
    process :resize_to_fill => [480, 480]
  end

  version :big do
    process :resize_to_fill => [640, 640]
  end
end