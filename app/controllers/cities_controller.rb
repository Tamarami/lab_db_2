class CitiesController < ApplicationController

  before_action :set_city, only: [:edit, :update, :destroy]

  def index
    @cities = City.all
  end

  def new
    @city = City.new
  end

  def create
    @city = City.create(city_params)
    if @city.save
      redirect_to cities_path, notice: 'Город создан!'
    else
      flash[:error] = 'Укажите правильные данные!'
      redirect_to cities_path
    end
  end

  def edit
  end

  def update
    if @city.update(city_params)
      redirect_to cities_path, notice: 'Обновлено!'
    else
      render :edit
    end
  end

  def destroy
    if @city.destroy
      redirect_to cities_path, notice: 'Город удален из справочника'
    else
      redirect_to cities_path, alert: 'Ошибка удаления'
    end
  end

  private

  def city_params
    params.require(:city).permit(:name, :postal_code, :country_code)
  end

  def set_city
    @city = City.find(params[:id])
  end

end
