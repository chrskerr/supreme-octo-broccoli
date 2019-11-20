class Flight < ApplicationRecord
    belongs_to :plane
    has_many :reservations

    attr_accessor :taken_seats

end
