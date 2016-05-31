class ListingsController < ApplicationController
  before_action :must_be_lender, only: [:new, :create, :update, :destroy]
  before_action :find_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  # before_action :authorized_user, only: [:edit, :update, :destroy]


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

  def destroy
    @tool.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Link was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def must_be_lender
    unless current_user && current_user.is_lender?
      redirect_to root_path, notice: "Some message"
    end
  end

  def find_post
    @tool = Listing.find(params[:id])
  end

  def query_p
    params.require(:listing).permit(:tool, :price, :location)
  end

end
