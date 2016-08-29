class SessionsController < ApplicationController
  def create
    if params[:commit] != "login"
      @user = User.from_omniauth(env["omniauth.auth"])
      facebook_login(@user)
    elsif params[:artist]
      @user = Artist.find_by(username: params[:artist][:username])
    elsif params[:fan]
      @user = Fan.find_by(username: params[:fan][:username])
    end
    handle_user(@user)
  end

  def destroy
    reset_session
    redirect_to root_path
  end

  private
    def invalid_username(user)
      if user.nil?
        flash[:message] = "Login info not found! Please enter a valid username"
        redirect_to '/login'
      end
    end

    def validate_password(user)
      if params[:provider] == "facebook"
          login(user)
          redirect_to user
      elsif user.authenticate(params[:password])
        login(user)
        redirect_to user
      else
        flash[:message] = "Please Enter the Correct Password"
        redirect_to '/login'
      end
    end

    def facebook_login(user)
      if Fan.find_by(username: @user.email)
        @user = Fan.find_by(username: @user.email)
      else
        @user = Artist.find_by(username: @user.email)
      end
    end

    def handle_user
      if @user
        validate_password(@user)
      else
        invalid_username(@user)
      end
    end
end
