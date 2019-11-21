class Reservation < ApplicationRecord
    belongs_to :user, :optional => true
    belongs_to :flight, :optional => true

    validates :seat, :presence => true
    validates :flight_id, :presence => true
    

end
