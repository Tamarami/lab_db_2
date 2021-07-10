class VacanciesController < ApplicationController

  before_action :set_vacancy, only: [:edit, :update, :destroy]

  def index
    @vacancies = Vacancy.ordered
  end

  def new
    @vacancy = Vacancy.new
  end

  def create
    @vacancy = Vacancy.create(vacancy_params)
    redirect_to vacancies_path
  end

  def edit
  end

  def update
    if @vacancy.update(vacancy_params)
      redirect_to vacancies_path
    else
      render :edit
    end
  end

  def destroy
    if @vacancy.destroy
      redirect_to vacancies_path, notice: 'Вакансия удалена'
    else
      redirect_to vacancies_path, alert: error_messages(@vacancy)
    end
  end

  private

  def vacancy_params
    params.require(:vacancy).permit(:name_profession, :free_work_places, :wage, :applicant_education, :workplace_address, :experience, :proficiency_languages, :presence_driver_license, :employer_id, :handbook_vacancy_id, :region_id, :education_id)
  end

  def set_vacancy
    @vacancy = Vacancy.find(params[:id])
  end

end
