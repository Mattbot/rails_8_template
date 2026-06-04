module JwtAuthenticatable
  extend ActiveSupport::Concern

  included do
    helper_method :current_jwt_payload
  end

  private

  def authenticate_jwt_token!
    @current_jwt_payload = JwtService.decode(jwt_bearer_token)
  rescue JwtService::Error
    render json: { error: "Unauthorized" }, status: :unauthorized
  end

  def current_jwt_payload
    @current_jwt_payload
  end

  def jwt_bearer_token
    header = request.headers["Authorization"].to_s
    match = header.match(/\ABearer\s+(.+)\z/i)

    match && match[1]
  end
end
