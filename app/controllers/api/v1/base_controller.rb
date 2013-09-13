module Api
  module V1
    class BaseController < ::ApplicationController
      before_filter :enforce_authentication
      before_filter :enforce_format

      protected
      def current_user
        User.find_by_token(user_token) if user_token
      end

      def user_token
        match = request.authorization.match(/^Token (.*)$/) if request.authorization
        match[1] if match
      end

      def enforce_authentication
        return # No authentication for now
        raise Polycloud::Exceptions::AccessDenied unless current_user
      end

      def enforce_format
        request.formats = [:json]
      end
    end
  end
end
