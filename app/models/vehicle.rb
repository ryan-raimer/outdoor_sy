# frozen_string_literal: true

class Vehicle < ApplicationRecord
  belongs_to :customer

  validates_presence_of :customer_id
end
