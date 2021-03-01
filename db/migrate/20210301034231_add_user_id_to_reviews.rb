class AddUserIdToReviews < ActiveRecord::Migration[6.0]
  def change
    remove_column :reviews, :user_id, :references
    add_reference :reviews, :user, foreign_key: true
  end
end
