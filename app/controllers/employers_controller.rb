class EmployersController < ApplicationController

  before_action :set_employer, only: [:edit, :update, :destroy]

  def index
    @employers = Employer.ordered
  end

  def new
    @employer = Employer.new
  end

  def create
    @employer = Employer.create(employer_params)
    redirect_to employers_path
  end

  def edit
  end

  def update
    if @employer.update(employer_params)
      redirect_to employers_path
    else
      render :edit
    end
  end

  def destroy
    if @employer.destroy
      redirect_to employers_path, notice: 'Работодатель удален'
    else
      redirect_to employers_path, alert: error_messages(@employer)
    end
  end

  private

  def employer_params
    params.require(:employer).permit(:name, :contact_phone_number, :contact_person_surname, :actual_address, :contact_e_mail, :region_id)
  end

  def set_employer
    @employer = Employer.find(params[:id])
  end

end
