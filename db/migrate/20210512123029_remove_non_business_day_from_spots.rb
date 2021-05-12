class RemoveNonBusinessDayFromSpots < ActiveRecord::Migration[6.1]
  def change
    remove_column :spots, :non_business_day, :string
  end
end
