class ListsController < ApplicationController
  def index
    @list = List.new
    @lists = List.all
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    @lists = List.all
    if @list.save
      redirect_to list_path(@list)
    else
      render :index, status: :unprocessable_entity
    end
  end

  def show
    @list = List.find(params[:id])
    @bookmarks = @list.bookmarks.all
    @review = Review.new
    @reviews = @list.reviews.all
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end
end
