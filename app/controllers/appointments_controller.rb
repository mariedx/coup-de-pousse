class AppointmentsController < ApplicationController
  before_action :authenticate_user

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

    @garden = Garden.find(params[:id])
    @host = @garden.user
    @guest = current_user

    @appointment = Appointment.new(app_params, garden: @garden, host: @host, guest: @guest)

    if @appointment.after_save
      redirect_to appointment_path(@appointment.id)
      flash[:success] = "Le rendez-vous est pris !"
    else
    render :new
    end

  end


  private


  def app_params
    app_params = params.require(:appointment).permit(:start_date, :end_date, :message_contact)
  end



end
