class ListsController < ApplicationController

  def index
    @list = List.last
  end

  def show
    @list = List.friendly.find(params[:id])
  end

end
