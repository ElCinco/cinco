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

end
