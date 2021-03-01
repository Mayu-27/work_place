class Review < ApplicationRecord
  with_options presence: true do
    validates :overall_evaluation, numericality: {less_than_or_equal_to: 5, greater_than_or_equal_to: 1}, presence: true
  end

  belongs_to :user
  belongs_to :spot
end


