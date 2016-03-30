require 'date'

class Cat < ActiveRecord::Base
  COLORS = %w( violet indigo blue green yellow orange red)

  validates :birth_date, :color, :name, :sex, :description, presence: true
  validates :sex, inclusion: { in: ["M", "F"],
    message: "Sex must be 'M' or 'F'" }
  validates :color, inclusion: { in: COLORS, message: "Must be a rainbow cat!"}

  def age
    (Date.today - self.birth_date).to_i/365
  end


end
