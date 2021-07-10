class ResumesController < ApplicationController

  before_action :set_resume, only: [:edit, :update, :destroy]

  def index
    @resumes = Resume.ordered
  end

  def new
    @resume = Resume.new
  end

  def create
    @resume = Resume.create(resume_params)
    redirect_to resumes_path
  end

  def edit
  end

  def update
    if @resume.update(resume_params)
      redirect_to resumes_path
    else
      render :edit
    end
  end

  def destroy
    if @resume.destroy
      redirect_to resumes_path, notice: 'Резюме удалено'
    else
      redirect_to resumes_path, alert: error_messages(@resume)
    end
  end

  private

  def resume_params
    params.require(:resume).permit(:applicant_surname, :name, :middle_name, :year_birth, :gender, :region_residence, :address, :applicant_education, :phone, :applicant_email, :desired_work, :desired_wage, :profession_position, :experience, :proficiency_languages, :presence_driver_license, :user_id, :region_id, :handbook_vacancy_id, :education_id)
  end

  def set_resume
    @resume = Resume.find(params[:id])
  end

end
