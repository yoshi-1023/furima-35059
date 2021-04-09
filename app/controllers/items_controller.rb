class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  def index
    @items = Item.all.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    unless @item.user_id == current_user.id
      redirect_to action: :index
    end
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
   if @item.save
    redirect_to item_path(@item)
   else
    render :edit
   end 
  end

  private

  def item_params
    params.require(:item).permit(:image, :item_name, :item_text, :category_id, :product_status_id, :shipping_charges_id, :prefectures_id, :shipping_date_id, :price).merge( user_id: current_user.id )
  end
  
end
