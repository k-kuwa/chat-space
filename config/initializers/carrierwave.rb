CarrierWave.configure do |config|
  config.fog_credentials = {
    provider:                'AWS',
    aws_access_key_id:       ENV['AWS_ACCESS_KEY_ID'],
    aws_secret_access_key:   ENV['AWS_SECRET_KEY'],
    region:                  'ap-northeast-1',
    path_style:               'true'
  }
  case Rails.env
    when 'development'
      config.fog_directory = 'chatspace-test'
      config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/chatspace-test'
    when 'production'
      config.fog_directory = 'chatspace-product'
      config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/chatspace-product'
    when 'test'
      config.fog_directory = 'chatspace-test'
      config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/chatspace-test'
  end
end
