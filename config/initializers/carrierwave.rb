::CarrierWave.configure do |config|
  if Rails.env.test? or Rails.env.cucumber?
    config.storage = :file
    config.enable_processing = false
  else
    config.storage             = :qiniu
    config.qiniu_bucket_private= false #default is false
    config.qiniu_block_size    = 4*1024*1024
    config.qiniu_protocol      = "http"
    unless Rails.env.production?
      config.qiniu_access_key    = "_03eDFQi9ikQrPO-beUdPfSEbBt36TQNzMz4FB1t"
      config.qiniu_secret_key    = "fZ70A0otHBYWRwMdTMCYUvdZ9VptuiilQ7eCdRxK"
      config.qiniu_bucket        = "test"
      config.qiniu_bucket_domain = "ohao5tmd8.bkt.clouddn.com"
    else
      config.qiniu_access_key    = ENV["QB_QN_AE"]
      config.qiniu_secret_key    = ENV["QB_QN_SE"]
      config.qiniu_bucket        = ENV["QB_QN_BUCKET"]
      config.qiniu_bucket_domain = ENV["QB_QN_BUCKET_DOMAIN"]
    end

  end
end
