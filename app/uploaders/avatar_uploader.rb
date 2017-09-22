class AvatarUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  version :thumb do
    process resize_to_limit: [150, 150]
  end

  version :medium do
    process resize_to_limit: [300, 300]
  end

  version :large do
    process resize_to_limit: [1242, 1242]
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def default_url
    ""
  end
end
