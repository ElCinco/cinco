class LinksController < ApplicationController
  def index
  end

  def show
    @link = Link.friendly.find(params[:id])
  end

end
