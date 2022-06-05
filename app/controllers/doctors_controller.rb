class DoctorsController < ApiController
  before_action :authenticate_user!, except: %i[ index show ]
  before_action :set_doctor, only: %i[ show update destroy ]

  # GET /doctors
  def index
    @doctors = Doctor.all
    render json: @doctors, include: [{specialty: { only: :name }}], methods: :appointments_in_progress
  end

  # GET /doctors/1
  def show
    render json: @doctor, include: [{specialty: { only: :name }}], methods: :appointments_in_progress
  end

  # POST /doctors
  def create
    @doctor = Doctor.new(doctor_params)
    @doctor.user.save!

    if @doctor.save
      render json: @doctor, status: :created
    else
      render json: @doctor.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /doctors/1
  def update
    if @doctor.update(doctor_params)
      render json: @doctor
    else
      render json: @doctor.errors, status: :unprocessable_entity
    end
  end

  # DELETE /doctors/1
  def destroy
    @doctor.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_doctor
      @doctor = Doctor.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def doctor_params
      params.require(:doctor).permit(:name, :specialty_id, user_attributes: [:email, :password])
    end
end
