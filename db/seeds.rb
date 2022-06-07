# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


# Specialty.create(name: 'Dentist')
# Specialty.create(name: 'Ophthalmologist')
# Specialty.create(name: 'Cardiologist')

# @doctor = Doctor.new(name: 'Den Dent', specialty_id: 1, user_attributes: {email: 'dendent@gmail.com', password: '12345678'})
# @doctor.user.save!
# @doctor.save

# @doctor = Doctor.new(name: 'Steve Eye', specialty_id: 2, user_attributes: {email: 'steveeye@gmail.com', password: '12345678'})
# @doctor.user.save!
# @doctor.save

# @doctor = Doctor.new(name: 'Megan Peek', specialty_id: 2, user_attributes: {email: 'meganpeek@gmail.com', password: '12345678'})
# @doctor.user.save!
# @doctor.save

# @doctor = Doctor.new(name: 'Rick Cardo', specialty_id: 3, user_attributes: {email: 'rickcardo@gmail.com', password: '12345678'})
# @doctor.user.save!
# @doctor.save

# @patient = Patient.new(name: 'Vlad Kom', gender: 'male', age: '21', user_attributes: {email: 'v@k.com', password: '12345678'})
# @patient.user.save!
# @patient.save

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?