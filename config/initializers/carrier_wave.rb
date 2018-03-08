# frozen_string_literal: true

CarrierWave.configure do |config|
  if Rails.env.production?
    config.fog_provider = "fog/aws"
    config.fog_credentials = {
      provider:              "AWS",
      aws_access_key_id:     ENV["AWS_ACCESS_KEY_ID"],
      aws_secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"],
      region:                ENV["AWS_REGION"],
    }
    config.storage :fog
    config.fog_directory  = ENV["S3_BUCKET_NAME"]
    config.fog_public     = true
    config.fog_attributes = { cache_control: "public, max-age=#{365.days.to_i}" }
  else
    config.storage :file
    config.asset_host = "#{ENV["DEFAULT_PROTOCOL"]}://#{ENV["DEFAULT_HOST"]}"
  end
end
