class RemoveClientIdFromReviews < ActiveRecord::Migration[6.0]
  def change
    remove_column :reviews, :client_id, :integer
  end
end
