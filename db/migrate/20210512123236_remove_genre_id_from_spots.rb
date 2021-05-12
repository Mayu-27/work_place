class RemoveGenreIdFromSpots < ActiveRecord::Migration[6.1]
  def change
    remove_column :spots, :genre_id, :string
  end
end
