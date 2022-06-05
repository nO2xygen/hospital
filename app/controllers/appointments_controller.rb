class AppointmentsController < ApiController
  before_action :authenticate_user!
  before_action :set_appointment, only: %i[ show update destroy ]

  # GET /appointments
  def index
    @appointments = current_user.role.appointments
    render json: @appointments, include: [:doctor]
  end

  # GET /appointments/1
  def show
    render json: @appointment
  end

  def new

  end

  # POST /appointments
  def create
    @patient = current_user.role
    @appointment = @patient.appointments.build(appointment_params)

    # @appointment = Appointment.new(appointment_params)

    if @appointment.save
      render json: @appointment, status: :created, location: @appointment
    else
      render json: @appointment.errors
    end
  end

  # PATCH/PUT /appointments/1
  def update
    if @appointment.update(appointment_params)
      render json: @appointment
    else
      render json: @appointment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /appointments/1
  def destroy
    @appointment.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_appointment
      @appointment = Appointment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def appointment_params
      params.require(:appointment).permit(:name, :description, :completed, :doctor_id)
    end
end
