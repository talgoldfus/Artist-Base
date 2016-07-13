class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_artist
    Artist.find(session[:artist_id]) if session[:artist_id]
  end

  def current_fan
    Fan.find(session[:fan_id]) if session[:fan_id]
  end

  def login(user)
    if user.class == Artist
      session[:artist_id] = user.id
    elsif user.class == Fan
      session[:fan_id] = user.id
    end
  end

  def logged_in?
    !!current_fan || !!current_artist
  end

  def login_required
    if !logged_in?
      redirect_to login_path
    end
  end
end
