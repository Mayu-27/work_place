class AddAccessToSpots < ActiveRecord::Migration[6.1]
  def change
    add_column :spots, :access, :string
  end
end
