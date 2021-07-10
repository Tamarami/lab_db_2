class HandbookVacanciesController < ApplicationController

  before_action :set_handbook_vacancy, only: [:edit, :update, :destroy]

  def index
    @handbook_vacancies = HandbookVacancy.ordered
  end

  def new
    @handbook_vacancy = HandbookVacancy.new
  end

  def create
    @handbook_vacancy = HandbookVacancy.create(handbook_vacancy_params)
    redirect_to handbook_vacancies_path
  end

  def edit
  end

  def update
    if @handbook_vacancy.update(handbook_vacancy_params)
      redirect_to handbook_vacancies_path
    else
      render :edit
    end
  end

  def destroy
    if @handbook_vacancy.destroy
      redirect_to handbook_vacancies_path, notice: 'Вид вакансии удалён из справочника'
    else
      redirect_to handbook_vacancies_path, alert: error_messages(@handbook_vacancy)
    end
  end

  private

  def handbook_vacancy_params
    params.require(:handbook_vacancy).permit(:code, :name)
  end

  def set_handbook_vacancy
    @handbook_vacancy = HandbookVacancy.find(params[:id])
  end

end
