class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    
    @item = Item.new(item_params)
    
    if @item.save
      redirect_to root_path
    else
      redirect_to root_path
    end
  end
  
  def destroy
    item = Item.find(params[:id])
    if item.destroy
      redirect_to root_path, notice: '削除しました'
    else
      render :edit
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end  

  def show
    @item = Item.find(params[:id])
  end  

  private

  def item_params
    params.require(:item).permit(:name, :image, :info, :category, :status, :price, :postage, :prefecture, :shipping_date, :price_tax, :brand).merge(user_id: current_user.id)
  end


end