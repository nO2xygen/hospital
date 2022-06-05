class Doctor < ApplicationRecord
  has_one :user, as: :role, dependent: :destroy
  has_many :appointments
  has_many :patients, through: :appointments
  belongs_to :specialty
  accepts_nested_attributes_for :user

  def appointments_in_progress
    self.appointments.where(completed: false).count
  end
end
