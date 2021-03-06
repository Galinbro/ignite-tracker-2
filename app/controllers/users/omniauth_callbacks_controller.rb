class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @user = User.from_omniauth(request.env["omniauth.auth"])
    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication #this will throw if @user is not activated
      # set_flash_message(:notice, :success, kind: "Google") if is_navigational_format?
      flash[:notice] = "Welcome #{current_user.name}."
    else
      #session["devise.google_oauth2_data"] = request.env["omniauth.auth"].except(:extra)
      session["devise.google_oauth2_data"] = request.env["omniauth.auth"].provider, request.env["omniauth.auth"].uid, request.env["omniauth.auth"].extra.raw_info.name, request.env["omniauth.auth"].info.email, request.env["omniauth.auth"].info.image
      #redirect_to new_user_registration_url
      flash[:alert] = @user.errors.full_messages[0]
      redirect_to user_session_path
    end
  end

  def failure
    redirect_to root_path
  end
end