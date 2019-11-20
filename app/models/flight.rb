class Flight < ApplicationRecord
    belongs_to :plane, :optional => true
    has_many :reservations

    validates :number, :presence => true
    validates :origin, :presence => true
    validates :destination, :presence => true
    validates :date, :presence => true
    validates :plane_id, :presence => true

    attr_accessor :taken_seats

end
