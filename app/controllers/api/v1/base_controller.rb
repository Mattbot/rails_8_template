module Api
  module V1
    class BaseController < ApplicationController
      include JwtAuthenticatable
    end
  end
end
