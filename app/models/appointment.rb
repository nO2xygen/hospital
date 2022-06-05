class Appointment < ApplicationRecord
  belongs_to :patient
  belongs_to :doctor
  accepts_nested_attributes_for :doctor

  before_save :check_max_appointment # 10 max

  def check_max_appointment
    doctor = Doctor.find(self.doctor_id)
    if doctor.appointments.where(completed: false).count >= 10
      errors.add(:base, "doctor has max (10) appoiitments in progress")
      throw(:abort)
    end

  end
  
end
