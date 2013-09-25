module Api
  module V1
    module Snippets
      class MainController < ::Api::V1::BaseController
        respond_to :json

        def index
          @snippets = current_address.snippets
          respond_with @snippets, root: 'snippets'
        end

        def show
          @snippet = current_address.snippets.find params[:id]
          respond_with @snippet
        end

        def create
          @snippet = current_address.snippets.new permitted_params

          if current_address.authenticate?
            @snipper.user = current_user
          end

          @snippet.save
          respond_with @snippet
        end

        def update
          @snippet = current_address.snippets.find params[:id]
          @snippet.update_attributes permitted_params
          respond_with @snippet
        end

        def destroy
          @snippet = current_address.snippets.find params[:id]
          @snippet.destroy
          respond_with @snippet
        end

        private
        def permitted_params
          params.require(:snippet).permit(:content, :language_id)
        end
      end
    end
  end
end
