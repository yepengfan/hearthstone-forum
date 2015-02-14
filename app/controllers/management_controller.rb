class ManagementController < ApplicationController
  before_action :check_login

  def manage
    
  end

  # check whether user has loged in. If users access to other user's account,
  # they will get a warning and redirect to root page.
  private
  def check_login
    redirect_to :new_user_session unless user_signed_in?

    if current_user && current_user.name != params[:name]
      flash[:notice] = "Sorry #{current_user.name}, you can't access to this account!"
      redirect_to :root
    end
  end
end
