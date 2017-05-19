class AdminController < ApplicationController
  before_action :authenticate_user!
  def index
    @list = List.last
  end

  def create_user
  end

  def create_list
    if !List.created_for_today
      @list = List.new
      @list.publish_date = Date.today
      @list.save
    end

    @list = List.created_for_today

    @list
  end

  def new_link
    @link = Link.new
  end

  def create_link
    @link = Link.create(link_params)

    if !List.created_for_today
      create_list
    end

    @link.list = List.created_for_today
    @link.title = get_title(@link.url)
    @link.user = current_user

    @link.save

    redirect_to admin_path
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
    page = a.get(url)
    @title = page.at('head title').text.strip

    return @title
  end

  private
    def list_params
      params.require(:list).permit(:publish_date)
    end

    def link_params
      params.require(:link).permit(:url, :title, :list_id)
    end
end
