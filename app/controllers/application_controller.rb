class ApplicationController < ActionController::Base

  rescue_from Polycloud::Exceptions::AccessDenied, with: :access_denied

  private
  def access_denied
    respond_to do |format|
      format.json do
        render json: {status: 'access denied'}, status: 401
      end
      format.html do
        render text: 'access denied', status: 401
      end
    end
  end
end
