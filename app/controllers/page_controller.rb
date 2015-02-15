class PageController < ApplicationController
  def home
    @enrolment = Enrolment.new
    @match = Match.where(status: true).first
  end

  def create_enrolment
    @enrolment = Enrolment.new(:account => enrolment_params[:account], :match_id => enrolment_params[:match_id])
    @enrolment.save
    @match = Match.where(status: true).first

    # redirect_to root_path
    render "home"
  end

  def enrolment_params
    params.require(:enrolment).permit!
  end
end
