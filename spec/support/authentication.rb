module Polycloud::RSpecAuthentication

  def self.included(klass)
    klass.class_eval do

      def sign_in(user)
        request.env['HTTP_AUTHORIZATION'] = "Token #{user.token}"
      end
    end
  end
end

RSpec.configure do |c|
  c.include Polycloud::RSpecAuthentication, type: :controller
end
