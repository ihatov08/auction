class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      # redirect_to "/items/#{@item.id}"
      redirect_to "/items"
      #redirect_to "/items"だとindexページにリダイレクトする
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :seller_id, :description, :email, :image_url)
  end
end
