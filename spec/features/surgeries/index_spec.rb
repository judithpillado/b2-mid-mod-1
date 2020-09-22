require "rails_helper"

RSpec.describe "Surgery Index Page" do

  before(:each) do
    # Hospitals:
    @hospital1 =  Hospital.create!(name: "Grey Sloan Memorial Hospital")
    @hospital2 =  Hospital.create!(name: "Seaside Health & Wellness Center")

    # Doctors:
    @meredith = @hospital1.doctors.create!(name: "Meredith Grey", specialty: "General Surgery", university: "Harvard University")
    @karev = @hospital1.doctors.create!(name: "Alex Karev", specialty: "Pediatric Surgery", university: "Johns Hopkins University")
    @bailey = @hospital2.doctors.create!(name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford University")
    @mcdreamy = @hospital2.doctors.create!(name: "Derek McDreamy Shepherd", specialty: "Attending Surgeon", university: "University of Pennsylvania")

    # Surgeries:
    @appendectomy = Surgery.create!(title: "Appendectomy", weekday: "Monday", o_r: 1)
    @cholecystectomy = Surgery.create!(title: "Cholecystectomy", weekday: "Tuesday", o_r: 2)
    @hysteroscopy = Surgery.create!(title: "Hysteroscopy", weekday: "Wednesday", o_r: 3)
    @tonsillectomy = Surgery.create!(title: "Tonsillectomy", weekday: "Monday", o_r: 1)

    # DoctorSurgeries:
    DoctorSurgery.create(doctor_id: @meredith.id, surgery_id: @appendectomy.id)
    DoctorSurgery.create(doctor_id: @meredith.id, surgery_id: @cholecystectomy.id)

    DoctorSurgery.create(doctor_id: @karev.id, surgery_id: @cholecystectomy.id)
    DoctorSurgery.create(doctor_id: @karev.id, surgery_id: @hysteroscopy.id)

    DoctorSurgery.create(doctor_id: @bailey.id, surgery_id: @hysteroscopy.id)
    DoctorSurgery.create(doctor_id: @bailey.id, surgery_id: @tonsillectomy.id)

    DoctorSurgery.create(doctor_id: @mcdreamy.id, surgery_id: @tonsillectomy.id)
    DoctorSurgery.create(doctor_id: @mcdreamy.id, surgery_id: @appendectomy.id)
  end

  it "displays the surgery titles along with the doctors performing the surgeries" do

    visit "/surgeries"

    within "#surgery-#{@appendectomy.id}" do
      expect(page).to have_content("Surgery: #{@appendectomy.title}")
      expect(page).to have_content(@meredith.name)
      expect(page).to have_content(@mcdreamy.name)
    end

    within "#surgery-#{@cholecystectomy.id}" do
      expect(page).to have_content("Surgery: #{@cholecystectomy.title}")
      expect(page).to have_content(@meredith.name)
      expect(page).to have_content(@karev.name)
    end

    within "#surgery-#{@hysteroscopy.id}" do
      expect(page).to have_content("Surgery: #{@hysteroscopy.title}")
      expect(page).to have_content(@karev.name)
      expect(page).to have_content(@bailey.name)
    end

    within "#surgery-#{@tonsillectomy.id}" do
      expect(page).to have_content("Surgery: #{@tonsillectomy.title}")
      expect(page).to have_content(@bailey.name)
      expect(page).to have_content(@mcdreamy.name)
    end
  end

end
