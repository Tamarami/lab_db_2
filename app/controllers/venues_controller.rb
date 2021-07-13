# type is reserved word so only type_venue
class VenuesController < ApplicationController

  before_action :set_venue, only: [:edit, :update, :destroy]

  def index
    @venues = Venue.all
  end

  def new
    @venue = Venue.new
  end

  def create
    @venue = Venue.create(venue_params)
    if @venue.save
      redirect_to venues_path, notice: 'Место проведения создано!'
    else
      flash[:error] = 'Укажите правильные данные!'
      redirect_to venues_path
    end
  end

  def edit
  end

  def update
    if @venue.update(venue_params)
      redirect_to venues_path, notice: 'Обновлено!'
    else
      render :edit
    end
  end

  def destroy
    if @venue.destroy
      redirect_to venues_path, notice: 'Место проведения удалено'
    else
      redirect_to venues_path, alert: 'Ошибка удаления'
    end
  end

  private

  def venue_params
    params.require(:venue).permit(:name, :street_address, :type_venue, :postal_code, :country_code)
  end

  def set_venue
    @venue = Venue.find(params[:id])
  end

end
