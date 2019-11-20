class Plane < ApplicationRecord
    has_many :flights

    validates :name, :presence => true
    validates :row, :presence => true
    validates :column, :presence => true
end
