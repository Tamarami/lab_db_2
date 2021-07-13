class CountriesController < ApplicationController

  before_action :set_country, only: [:edit, :update, :destroy]

  def index
    @countries = Country.all
  end

  def new
    @country = Country.new
  end

  def create
    @country = Country.create(country_params)
    if @country.save
      redirect_to countries_path, notice: 'Страна создана!'
    else
      flash[:error] = 'Укажите правильные данные!'
      redirect_to countries_path
    end
  end

  def edit
  end

  def update
    if @country.update(country_params)
      redirect_to countries_path, notice: 'Обновлено!'
    else
      render :edit
    end
  end

  def destroy
    @country.cities.each { |item| item.destroy! }
    if @country.destroy
      redirect_to countries_path, notice: 'Страна удалена из справочника'
    else
      redirect_to countries_path, alert: 'Ошибка удаления'
    end
  end

  private

  def country_params
    params.require(:country).permit(:country_code, :country_name)
  end

  def set_country
    @country = Country.find(params[:id])
  end

end
