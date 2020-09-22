class DoctorSurgeriesController < ApplicationController

  def create
    DoctorSurgery.create(doctor_surgery_params)
    redirect_to "/surgeries/#{params[:surgery_id]}"

  end

  private

  def doctor_surgery_params
    params.permit(:doctor_id, :surgery_id)
  end

end
