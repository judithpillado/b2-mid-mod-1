require "rails_helper"

RSpec.describe Surgery do

  describe "validations" do
    it {should validate_presence_of :title}
    it {should validate_presence_of :weekday}
    it {should validate_numericality_of :o_r}
  end

  describe "relationships" do
    it {should have_many :doctor_surgeries}
    it {should have_many(:doctors).through(:doctor_surgeries)}
  end

end
