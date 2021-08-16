# frozen_string_literal: true

class Customer < ApplicationRecord
  has_many :vehicles

  def full_name
    "#{first_name} #{last_name}"
  end

end
