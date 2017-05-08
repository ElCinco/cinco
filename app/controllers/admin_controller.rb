class AdminController < ApplicationController
  before_action :authenticate_user!
  def index
    @list = List.last
  end

  def create_user
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
end
