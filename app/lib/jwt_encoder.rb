require 'jwt'

module JwtEncoder
  extend self

  HMAC_SECRET = Settings.secrets.secret_key_base

  def encode(payload)
    JWT.encode(payload, HMAC_SECRET)
  end

  def decode(token)
    JWT.decode(token, HMAC_SECRET).first
  end
end
