class BetaSignupsController < ApplicationController
    protect_from_forgery with: :exception 

    def new
    end

    def create        
        signup = params.require(:beta_signup)
        username = signup.require(:username)
        email = signup.require(:email)
        
        unless valid_email? email
            raise "invalid email"
        end

        BetaSignup.new(username: username, email: email)
        redirect_to laughs_url
    end

    def valid_email?(email)
        false
    end
end
