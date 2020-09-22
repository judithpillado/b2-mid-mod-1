class Surgery < ApplicationRecord

  validates_presence_of :title, :weekday
  validates_numericality_of :o_r

  has_many :doctor_surgeries
  has_many :doctors, through: :doctor_surgeries

  def same_day_surgeries
    # require "pry"; binding.pry
    # Surgery.all.pluck(:weekday)
    # Surgery.all.group(:title, :weekday)
  end

end
