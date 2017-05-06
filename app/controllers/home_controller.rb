class HomeController < ApplicationController
  def index
    # get the latest list
    @list = List.last
  end
end
