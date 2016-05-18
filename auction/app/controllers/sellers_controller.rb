class SellersController < ApplicationController

  def index
    @sellers = Seller.all
  end

  def show
    @seller = Seller.find(params[:id])
  end

  def new
    @seller = Seller.new
  end

  def edit
    @seller = Seller.find(params[:id])
  end

  def create
    @seller = Seller.new(seller_params)
    @seller.save
    redirect_to "/sellers/#{@seller.id}"
  end

  def update
    @seller = Seller.find(params[:id])
    @seller.update(seller_params)
    redirect_to "/sellers/#{@seller.id}"
  end

  private

  def seller_params
    params.require(:seller).permit(:name, :prefecture, :tel)
  end
end
