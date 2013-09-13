module Api
  module V1
    module Users
      class MainController < ::Api::V1::BaseController
        respond_to :json

        def show
          @user = User.find params[:id]
          respond_with @user
        end

      end
    end
  end
end
