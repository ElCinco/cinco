class LinksController < ApplicationController
  def index
  end

  def show
    @link = Link.friendly.find(params[:id])
  end

  def vote_up
    begin
      current_or_guest_user.vote_for(@link = Link.find(params[:id]))
      redirect_back(fallback_location: root_path)
    rescue ActiveRecord::RecordInvalid
      render :nothing => true, :status => 404
    end
  end
end
