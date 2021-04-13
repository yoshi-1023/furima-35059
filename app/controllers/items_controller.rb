class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, except: [:index, :new, :create]
  before_action :move_to_index, only: [:edit, :update, :destroy]

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
  end

  def edit
  end

  def update
    if @item.update(item_params)
     redirect_to item_path(@item)
    else
     render :edit
    end 
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :item_name, :item_text, :category_id, :product_status_id, :shipping_charges_id, :prefectures_id, :shipping_date_id, :price).merge( user_id: current_user.id )
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    unless @item.user_id == current_user.id && @item.purchase_record.nil?
      redirect_to action: :index
    end
  end
  
end
