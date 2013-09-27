module Api
  module V1
    module Users
      class MainController < ::Api::V1::BaseController
        respond_to :json

        def show
          @user = current_address.users.find params[:id]
          respond_with @user
        end

        def create
          @user = current_address.users.create permitted_params
          respond_with @user
        end

        private
        def permitted_params
          params.require(:user).permit(:email, :password)
        end

      end
    end
  end
end
