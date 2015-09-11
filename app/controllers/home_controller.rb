class HomeController < ApplicationController

  def index
    #redirect to User sing-in path
    # redirect_to new_user_session_path
    if user_signed_in?
      render 'index'
    else
      redirect_to new_user_session_path
    end
  end

end
