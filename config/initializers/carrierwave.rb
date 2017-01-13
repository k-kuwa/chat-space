CarrierWave.configure do |config|
  config.fog_credentials = {
    provider:                'AWS',
    aws_access_key_id:       ENV['AWS_Access_Key_Id'],
    aws_secret_access_key:   ENV['AWS_Secret_Key'],
    region:                  'ap-northeast-1',
    path_style:               'true'
  }
  case Rails.env
    when 'development'
        config.fog_directory = 'chatspace-test'
        config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/chatspace-test'
  end
end
