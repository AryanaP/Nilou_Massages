class PricesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index ]
  before_action :set_price, only: [:edit, :update, :destroy]

  def index
    @prices = policy_scope(Price).order(number: :asc)
  end

  def new
    @price = Price.new
    authorize @price
  end

  def create
    @price = Price.new(price_params)
    if @price.save
      redirect_to prices_path
    else
      render :new
    end
    authorize @price
  end

  def edit
    authorize @price
  end

  def update
    if @price.update(price_params)
      redirect_to prices_path
    else
      render :edit
    end
    authorize @price
  end

  def destroy
    if @price.destroy
      redirect_to prices_path
    end
    authorize @price
  end

  private

  def set_price
    @price = Price.find(params[:id])
  end

  def price_params
    params.require(:price).permit(:name, :description, :cost, :length, :number)
  end

end
