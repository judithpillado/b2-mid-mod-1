require "rails_helper"

RSpec.describe "Surgery Show Page" do

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
    @hysteroscopy = Surgery.create!(title: "Hysteroscopy", weekday: "Wednesday", o_r: 1)
    @tonsillectomy = Surgery.create!(title: "Tonsillectomy", weekday: "Monday", o_r: 3)

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

  it "displays the surgery title along with ORs" do

    visit "/surgeries"

    within "#surgery-#{@appendectomy.id}" do
      click_link "#{@appendectomy.title}"
    end

    expect(current_path).to eq("/surgeries/#{@appendectomy.id}")
    expect(page).to have_content(@appendectomy.title)
    expect(page).to have_content("Operating Room to be used: #{@appendectomy.o_r}")

    within '.same-day-surgeries' do
      expect(page).to have_content("Other surgeries happening this day of the week:")
      expect(page).to have_content(@tonsillectomy.title)
      expect(page).to_not have_content(@hysteroscopy.title)
    end
  end

  it "add a doctor to a surgery" do
    visit "/surgeries/#{@tonsillectomy.id}"

    expect(page).to have_content "Add a Doctor to this Surgery"

    new_doctor = @hospital1.doctors.create!(name: "Meredith Grey", specialty: "General Surgery", university: "Harvard University")

    fill_in :name, with: "#{new_doctor.name}"

    click_on "Submit"

    expect(current_path).to eq("/surgeries/#{@tonsillectomy.id}")
    # expect(page).to have_content("Meredith Grey")
  end

end
