class Flight < ApplicationRecord
    belongs_to :plane, :optional => true
    has_many :reservations

    attr_accessor :taken_seats

end
