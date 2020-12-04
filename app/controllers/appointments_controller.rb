class AppointmentsController < ApplicationController

  def new
    @garden = Garden.find_by id:(params[:garden_id])
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
    @appointment.garden_id = Garden.find(params[:garden_id].to_i)
    @appointment.host = User.find(1)
    @appointment.guest = current_user


    print'*'*62
    print params[:garden_id]

    if @appointment.save
      redirect_to appointment_path
      flash[:success] = "Le rendez-vous est pris !"
    else
    render :new
    end

  end

  def edit
    @appointment = Appointment.find(params[:id])

  end

  def update
    @appointment = Appointment.find(params[:id])
    if @appointment.update(app_params)
      redirect_to appointment_path(@appointment.id)
      flash[:notice] = "Rendez-vous modifié !"
    else
      flash.now[:alert] = "Impossible de modifier le rendez-vous :"
      render :edit
    end
  end

  def destroy
    Appointment.find(params[:id]).destroy
    redirect_to root_path
    flash[:notice] = "Rendez-vous supprimé !"

  end

  private

  def app_params
    app_params = params.require(:appointment).permit(:start_date, :end_date, :message_contact, :garden_id, :host_id, :guest_id)
  end

end
