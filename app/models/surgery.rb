class Surgery < ApplicationRecord

  validates_presence_of :title, :weekday
  validates_numericality_of :o_r

  has_many :doctor_surgeries
  has_many :doctors, through: :doctor_surgeries

  def same_day_surgeries(weekday)
    Surgery.where(weekday: weekday).pluck(:title)
  end

end
