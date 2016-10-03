if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      provider:              'AWS',
      region:                'ap-northeast-1',
      aws_access_key_id:      Settings.amazon_s3.access_key,
      aws_secret_access_key:  Settings.amazon_s3.access_id
    }
    config.fog_directory     =  'telsa' # bucket name
  end
end