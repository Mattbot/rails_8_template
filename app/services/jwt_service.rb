class JwtService
  DEFAULT_ALGORITHM = "HS256"
  DEFAULT_EXPIRES_IN = 3600

  class Error < StandardError; end
  class MissingSecretError < Error; end
  class MissingTokenError < Error; end
  class InvalidTokenError < Error; end
  class InvalidSignatureError < Error; end
  class TokenExpiredError < Error; end

  class << self
    def encode(payload, expires_in: DEFAULT_EXPIRES_IN, secret: jwt_secret, algorithm: DEFAULT_ALGORITHM)
      claims = payload.stringify_keys
      now = Time.current.to_i

      claims["iat"] ||= now
      claims["exp"] ||= now + expires_in if expires_in

      JWT.encode(claims, secret, algorithm)
    end

    def decode(token, secret: jwt_secret, algorithm: DEFAULT_ALGORITHM)
      raise MissingTokenError, "JWT token is missing" if token.blank?

      payload, = JWT.decode(
        token,
        secret,
        true,
        {
          algorithm: algorithm,
          verify_expiration: true
        }
      )

      payload
    rescue JWT::ExpiredSignature
      raise TokenExpiredError, "JWT token has expired"
    rescue JWT::VerificationError
      raise InvalidSignatureError, "JWT signature verification failed"
    rescue JWT::DecodeError
      raise InvalidTokenError, "JWT token is invalid"
    end

    private

    def jwt_secret
      secret = ENV["JWT_SECRET"].to_s
      raise MissingSecretError, "JWT_SECRET environment variable is required" if secret.empty?

      secret
    end
  end
end
