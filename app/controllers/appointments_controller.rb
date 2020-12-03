class AppointmentsController < ApplicationController

  def new
    @appointment = Appointment.new
  end

  def index
    @appointments = current_user.appointments
  end

  def show
    @appointment = Appointment.find(params[:id])
  end

  def create

    @appointment = Appointment.new(app_params)
    @appointment.garden = Garden.find(1)
    @appointment.host = Garden.find(1).user
    @appointment.guest = current_user

    if @appointment.save
      redirect_to appointment_path(@appointment.id)
      flash[:success] = "Le rendez-vous est pris !"
    else
    render :new
    end

  end

  def destroy
    Appointment.find(params[:id]).destroy
    redirect_to root_path
    flash[:notice] = "Rendez-vous supprimé !"

  end


  private


  def app_params

    app_params = params.require(:appointment).permit(:start_date, :end_date, :message_contact)
  end



end
