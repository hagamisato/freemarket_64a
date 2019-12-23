# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    callback_for(:facebook)
  end
  def google_oauth2
    callback_for(:google)
  end
 
  def callback_for(provider)
    info = User.find_oauth(request.env["omniauth.auth"])
    
    @user = User.where(nickname: info[:user][:nickname]).or(User.where(email: info[:user][:email])).first || info[:user]
   
    if @user.persisted?
     
      sign_in_and_redirect @user, event: :authentication
      set_flash_message(:notice, :success, kind: "#{provider}".capitalize) if is_navigational_format?
    else
      
      session[:nickname] = info[:user][:nickname]
      session[:email] = info[:user][:email]

      session[:password_confirmation] = SecureRandom.alphanumeric(30)

      
      if SnsCredential.find_by(uid: info[:sns][:uid], provider: info[:sns][:provider]).nil?
        
        session[:uid] = info[:sns][:uid]
        session[:provider] = info[:sns][:provider]
      end
      redirect_to reg_signups_path
    end
  end

  def failure
    redirect_to root_path
  end
end
  # You should configure your model like this:
  # devise :omniauthable, omniauth_providers: [:twitter]

  # You should also create an action method in this controller like this:
  # def twitter
  # end

  # More info at:
  # https://github.com/plataformatec/devise#omniauth

  # GET|POST /resource/auth/twitter
  # def passthru
  #   super
  # end

  # GET|POST /users/auth/twitter/callback
  # def failure
  #   super
  # end

  # protected

  # The path used when OmniAuth fails
  # def after_omniauth_failure_path_for(scope)
  #   super(scope)
  # end

