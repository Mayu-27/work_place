class ChangeColumnToNull < ActiveRecord::Migration[6.0]
  def change
    def up
      change_column_null :spots, :genre_id, true
      change_column_null :spots, :phone_number, true
      change_column_null :spots, :opening_hours, true
      change_column_null :spots, :non_business_day, true
    end
  end
end
