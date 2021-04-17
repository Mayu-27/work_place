class Review < ApplicationRecord
  with_options presence: true do
    validates :overall_evaluation, numericality: { less_than_or_equal_to: 5, greater_than_or_equal_to: 1 }, presence: true
    validates :atmosphere, numericality: { less_than_or_equal_to: 5, greater_than_or_equal_to: 1 }, presence: true
    validates :network_stability, numericality: { less_than_or_equal_to: 5, greater_than_or_equal_to: 1 }, presence: true
    validates :facility, numericality: { less_than_or_equal_to: 5, greater_than_or_equal_to: 1 }, presence: true
    validates :congestion, numericality: { less_than_or_equal_to: 5, greater_than_or_equal_to: 1 }, presence: true
    validates :corona_countermeasure, numericality: { less_than_or_equal_to: 5, greater_than_or_equal_to: 1 }, presence: true
    validates :comment, length: { maximum: 400 }
  end

  belongs_to :user
  belongs_to :spot
end
