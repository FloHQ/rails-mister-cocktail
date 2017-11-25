Cloudinary.config do |config|
  config.cloud_name = Figaro.env.CLOUDINARY_CLOUD_NAME
  config.api_key = Figaro.env.CLOUDINARY_API_KEY
  config.api_secret = Figaro.env.CLOUDINARY_API_SECRET
  config.cdn_subdomain = true
end
