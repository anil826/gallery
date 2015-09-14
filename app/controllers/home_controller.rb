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

  def get_data
    puts "----------------------hello-----------"
    if params[:email] == 'anil.enbake@gmail.com' && params[:api_token] == "64a0aee7a7ed1e6e2821160686de63c8da21e7c65182d99d2fc578a5ae2988bf"
      logger.info "--------------------Authentication success...---------------------"
       render :json => get_user.albums.first
    else
      render :json => {error: "bad request type"}
    end
  end

  private
  def get_user
    if user_signed_in?
      current_user
    else
      User.first
    end
  end
end
