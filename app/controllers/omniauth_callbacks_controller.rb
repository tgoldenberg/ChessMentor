class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @user = User.from_omniauth(request.env["omniauth.auth"])

    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end

  def stripe_connect
    @user = current_user
    if @user.update_attributes({
      provider: request.env["omniauth.auth"].provider,
      uid:      request.env["omniauth.auth"].uid,
      access_code: request.env["omniauth.auth"].credentials.token,
      publishable_key: request.env["omniauth.auth"].info.stripe_publishable_key
      })
      sign_in_and_redirect @user, :event => :authentication
      flash[:notice] = "Signed in with " + current_user.provider.to_s.titleize + " successfully."
    else
      session["devise.stripe_connect_data"] = request.env["omniauth.auth"]
      redirect_to root_url
    end
  end
end
