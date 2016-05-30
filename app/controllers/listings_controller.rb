class ListingsController < ApplicationController
  #before_action :set_post, :only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!,
    :only => [:destroy]

  before_filter :find_post!,
    :only => [:destroy]

  def index
    @tools = Listing.all.order('created_at DESC')
  end

  def new
    # @tool = Listing.new
    @tool = current_user.listings.build
  end

  def create
    @tool = current_user.listings.build(query_p)
    if @tool.save
      redirect_to @tool
    else
      render 'new'
    end
  end

  def show
    @tool = Listing.find(params[:id])
  end

  def edit
    @tool = Listing.find(params[:id])
  end

  def update
    @tool = Listing.find(params[:id])
    if @tool.update(query_p)
      redirect_to @tool
    else
      render 'edit'
    end
  end

  private

  def query_p
    params.require(:listing).permit(:tool, :price, :location)
  end

end
