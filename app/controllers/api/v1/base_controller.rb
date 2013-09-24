module Api
  module V1
    class BaseController < ::ApplicationController
      before_filter :enforce_authentication
      before_filter :enforce_format

      protected
      def current_address
        @current_addresss ||= Address.find_or_create_by(ip: request.ip)
      end

      def current_user
        @current_user ||= current_address.users.find_by_token(user_token) if user_token
      end

      def user_token
        match = request.authorization.match(/^Token (.*)$/) if request.authorization
        match[1] if match
      end

      def enforce_authentication
        raise Polycloud::Exceptions::AccessDenied if current_address.authenticate? && !current_user
      end

      def enforce_format
        request.formats = [:json]
      end
    end
  end
end
