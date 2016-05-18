class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
    @seller = Seller.find(@item.seller_id)
  end

  def new
    @item = Item.new
  end

  def edit
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to "/items/#{@item.id}"
      # redirect_to "/items"
      # だとindexページにリダイレクトする
    else
      render :new
    end
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    # 下記のコードでもほぼ同じ挙動をします
    # @item.assign_attributes(item_params)
    redirect_to "/items/#{@item.id}"
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :seller_id, :description, :email, :image_url)
  end
end
