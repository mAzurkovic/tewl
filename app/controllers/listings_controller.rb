class ListingsController < ApplicationController
  def index
    @tools = Listing.all
  end

  def new
    @tool = Listing.new
  end

  def create
    @tool = Listing.new(query_p)
    if @tool.save
      redirect_to @tool
    else
      render 'new'
    end
  end

  def show
    @tool = Listing.find(params[:id])
  end

  private

  def query_p
    params.require(:listing).permit(:tool, :price, :location)
  end

end
