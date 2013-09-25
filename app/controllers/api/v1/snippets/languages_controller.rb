module Api
  module V1
    module Snippets
      class LanguagesController < ::Api::V1::BaseController
        respond_to :json

        def index
          @languages = current_address.languages
          respond_with @languages, root: 'languages'
        end

        def show
          @language = current_address.languages.find params[:id]
          respond_with @language
        end

        def create
          @language = current_address.languages.new permitted_params
          @language.save
          respond_with @language
        end

        def update
          @language = current_address.languages.find params[:id]
          @language.update_attributes permitted_params
          respond_with @language
        end

        def destroy
          @language = current_address.languages.find params[:id]
          @language.destroy
          respond_with @language
        end

        private
        def permitted_params
          params.require(:language).permit(:title)
        end
      end
    end
  end
end
