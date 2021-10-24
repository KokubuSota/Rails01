require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  config.storage :fog
  config.fog_provider = 'fog/aws'
  config.fog_directory  = 'techboost20211016'
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id:'AKIARJ2LVSA5HDTTXDH5',
    aws_secret_access_key:'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',
    region: 'ap-northeast-1',
    path_style: true
  }
end