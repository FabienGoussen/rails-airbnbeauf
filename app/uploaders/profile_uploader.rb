# encoding: utf-8
# image profile picture
class PictureUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

end
