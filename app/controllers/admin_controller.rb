class AdminController < ApplicationController
  before_action :authenticate_user!
  def index
    @list = List.last
  end

  def create_user
  end

  def categories
  end

  def new_list
    @list = List.new
  end

  def create_list
    @list = List.new(params[:list])
  end

  def new_link
    @link = Link.new
  end

  def create_link
    @link = Link.new(params[:link])
  end

  def process_link
    # ajax endpoint that uses gem to process a potential link
    url = params[:url]
    @title = false # in case a.get fails
    a = Mechanize.new
    a.get(url) do |page|
      @title = page.title
    end


    respond_to do |format|
      format.js { render json: @title }
    end
  end
end
