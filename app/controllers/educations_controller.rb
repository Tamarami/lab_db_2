class EducationsController < ApplicationController

  before_action :set_education, only: [:edit, :update, :destroy]

  def index
    @educations = Education.ordered
  end

  def new
    @education = Education.new
  end

  def create
    @education = Education.create(education_params)
    redirect_to educations_path
  end

  def edit
  end

  def update
    if @education.update(education_params)
      redirect_to educations_path
    else
      render :edit
    end
  end

  def destroy
    if @education.destroy
      redirect_to educations_path, notice: 'Вид образования удалён из справочника'
    else
      redirect_to educations_path, alert: error_messages(@education)
    end
  end

  private

  def education_params
    params.require(:education).permit(:code, :name)
  end

  def set_education
    @education = Education.find(params[:id])
  end

end
