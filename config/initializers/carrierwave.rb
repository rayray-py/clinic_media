CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: Settings.AWS_S3[:access_key_id],
    aws_secret_access_key: Settings.AWS_S3[:secret_access_key],
    region: 'ap-northeast-1'
  }
  config.cache_storage = :fog

  case Rails.env
  when 'development'
    config.fog_directory = 'cliniclist-image/development'
    config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/cliniclist-image/development'
  when 'production'
    config.fog_directory = 'cliniclist-image/production'
    config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/cliniclist-image/production'
  when 'test'
    config.fog_directory = 'cliniclist-image/test'
    config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/cliniclist-image/test'
  end
end
