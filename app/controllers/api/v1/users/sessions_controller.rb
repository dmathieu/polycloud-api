module Api
  module V1
    module Users
      class SessionsController < ::Api::V1::BaseController
        skip_before_filter :enforce_authentication
        respond_to :json

        def create
          @user = current_address.users.find_by_email permitted_params[:email]
          if @user && @user.valid_password?(permitted_params[:password])
            @user.refresh_token!
          else
            raise Polycloud::Exceptions::AccessDenied
          end

          respond_with @user, root: :session, serializer: SessionSerializer
        end

        private
        def permitted_params
          params.require(:session).permit(:email, :password)
        end
      end
    end
  end
end
