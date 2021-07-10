class RegionsController < ApplicationController

  before_action :set_region, only: [:edit, :update, :destroy]

  def index
    @regions = Region.ordered
  end

  def new
    @region = Region.new
  end

  def create
    @region = Region.create(region_params)
    redirect_to regions_path
  end

  def edit
  end

  def update
    if @region.update(region_params)
      redirect_to regions_path
    else
      render :edit
    end
  end

  def destroy
    if @region.destroy
      redirect_to regions_path, notice: 'Регион удалён из справочника'
    else
      redirect_to regions_path, alert: error_messages(@region)
    end
  end

  private

  def region_params
    params.require(:region).permit(:code, :name)
  end

  def set_region
    @region = Region.find(params[:id])
  end

end
