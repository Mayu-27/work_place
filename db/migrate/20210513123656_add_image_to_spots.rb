class AddImageToSpots < ActiveRecord::Migration[6.1]
  def change
    add_column :spots, :img, :string
  end
end
