class ListsController < ApplicationController

  def index
    @list = List.last
  end

  def show
    @list = List.friendly.find(params[:id])
    if request.path != list_path(@list)
      redirect_to @list, status: :moved_permanently
    end
  end

  def vote_up
    begin
      current_user.vote_for(@list = List.link.find(params[:id]))
      render :nothing => true, :status => 200
    rescue ActiveRecord::RecordInvalid
      render :nothing => true, :status => 404
    end
  end

end
