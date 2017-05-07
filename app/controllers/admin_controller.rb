class AdminController < ApplicationController
  before_action :authenticate_user!
  def index
    @list = List.last
  end

  def create_user
  end

  def create_list_form
  end

  def create_list(link)
  end

  def create_link_form
    @link = Link.new
  end

  def create_link(link)
  end
end
