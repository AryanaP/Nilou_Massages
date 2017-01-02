class PartnersController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index ]
  before_action :set_partner, only: [:edit, :update, :destroy]

  def index
    @partners = policy_scope(Partner)
  end

  def new
    @partner = Partner.new
    authorize @partner
  end

  def create
    @partner = Partner.new(partner_params)
    if @partner.save
      redirect_to partners_path
    else
      render :new
    end
    authorize @partner
  end

  def edit
    authorize @partner
  end

  def update
    if @partner.update(partner_params)
      redirect_to partners_path
    else
      render :edit
    end
    authorize @partner
  end

  def destroy
    if @partner.destroy
      redirect_to partners_path
    end
    authorize @partner
  end

  private

  def set_partner
    @partner = Partner.find(params[:id])
  end

  def partner_params
    params.require(:partner).permit(:name, :description, :link, :email)
  end

end
