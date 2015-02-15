class ManagementController < ApplicationController
  before_action :check_login, only: :manage

  def manage
  end

  def new_match
    @match = Match.new
  end

  def create_match
    @match = Match.new
    @match.save_match(match_params)

    redirect_to new_match_path
  end

  def match_list
    @match_list = Match.all
  end

  def edit_match
    @match = Match.find(params[:id])
  end

  def active_match
    @match = Match.find(params[:id])
    @match.acitve

    redirect_to match_list_path
  end

  def export_enrolment
    @list = Enrolment.new
    @list.export_enrolment(params[:id])
    send_file Rails.root.join('private', 'enrol_list.csv'), :type=>"application/csv", :x_sendfile=>true
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

  def match_params
    params.require(:match).permit!
  end
end
