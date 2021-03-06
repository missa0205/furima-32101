class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :call_to_params, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, only: [:edit, :update, :destroy]

  def index
    @items = Item.includes(:user).order('created_at DESC')
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
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :introduction, :category_id, :condition_id, :postage_payer_id, :prefecture_id, :shipping_day_id, :price, :user_id).merge(user_id: current_user.id)
  end

  def call_to_params
    @item = Item.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index unless current_user.id == @item.user_id && @item.purchase.blank?
  end
end
