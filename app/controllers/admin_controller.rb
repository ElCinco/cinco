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
    @list = List.new(list_params)
  end

  def new_link
    @link = Link.new
  end

  def create_link
    @link = Link.create(link_params)
  end

  def process_link
    # ajax endpoint that uses gem to process a potential link
    url = params[:url]
    @title = get_title(url)

    respond_to do |format|
      format.json do
        render json: {
          title: @title
        }.to_json
      end
    end
  end

  def get_title(url)
    @title = false
    a = Mechanize.new
    a.get(url) do |page|
      @title = page.title
    end

    return @title
  end

  private
    def list_params
      params.require(:list).permit(:publish_date)
    end

    def link_params
      params.require(:link).permit(:url, :title, :category_id)
    end
end
