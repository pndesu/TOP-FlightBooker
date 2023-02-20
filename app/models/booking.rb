class Booking < ApplicationRecord
    belongs_to :flight
    has_and_belongs_to_many :passengers
    accepts_nested_attributes_for :passengers, allow_destroy: true, reject_if: :all_blank
    validate :require_one_passenger, on: :create

    private

    def require_one_passenger
        errors.add(:base, "You must provide at least two options") if passengers.size < 1
    end
end
