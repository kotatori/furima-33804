class ItemsController < ApplicationController
  before_action :authenticate_user!, only:[:new, :create, :edit, :update]
  before_action :set_item, only:[:show, :edit, :update]
  before_action :move, only:[:edit, :update]

  def index
    @items = Item.all.order(created_at: "DESC")
  end

  def show
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

  def edit
    # 事後学習のため残す
    # if user_signed_in?
    #   if current_user.id != @item.user_id
    #     redirect_to action: :index
    #   end
    # else
    #   redirect_to user_session_path
    # end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  private

    def item_params
      params.require(:item).permit(:product_name, :text, :category_id, :status_id, :shipping_charge_id, :prefecture_id, :shipping_date_id, :price, :image).merge(user_id: current_user.id)
    end

    def set_item
      @item = Item.find(params[:id])
    end

    def move
      if current_user.id != @item.user_id
        redirect_to action: :index
      end
    end
end
