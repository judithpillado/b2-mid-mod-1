# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Hospitals:
hospital1 =  Hospital.create!(name: "Grey Sloan Memorial Hospital")
hospital2 =  Hospital.create!(name: "Seaside Health & Wellness Center")

# Doctors:
meredith = hospital1.doctors.create!(name: "Meredith Grey", specialty: "General Surgery", university: "Harvard University")
karev = hospital1.doctors.create!(name: "Alex Karev", specialty: "Pediatric Surgery", university: "Johns Hopkins University")
bailey = hospital2.doctors.create!(name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford University")
mcdreamy = hospital2.doctors.create!(name: "Derek McDreamy Shepherd", specialty: "Attending Surgeon", university: "University of Pennsylvania")

# Surgeries:
appendectomy = Surgery.create!(title: "Appendectomy", weekday: "Monday", o_r: 1)
cholecystectomy = Surgery.create!(title: "Cholecystectomy", weekday: "Tuesday", o_r: 2)
hysteroscopy = Surgery.create!(title: "Hysteroscopy", weekday: "Wednesday", o_r: 3)
tonsillectomy = Surgery.create!(title: "Tonsillectomy", weekday: "Monday", o_r: 1)

# DoctorSurgeries:
DoctorSurgery.create(doctor_id: meredith.id, surgery_id: appendectomy.id)
DoctorSurgery.create(doctor_id: meredith.id, surgery_id: cholecystectomy.id)

DoctorSurgery.create(doctor_id: karev.id, surgery_id: cholecystectomy.id)
DoctorSurgery.create(doctor_id: karev.id, surgery_id: hysteroscopy.id)

DoctorSurgery.create(doctor_id: bailey.id, surgery_id: hysteroscopy.id)
DoctorSurgery.create(doctor_id: bailey.id, surgery_id: tonsillectomy.id)

DoctorSurgery.create(doctor_id: mcdreamy.id, surgery_id: tonsillectomy.id)
DoctorSurgery.create(doctor_id: mcdreamy.id, surgery_id: appendectomy.id)
