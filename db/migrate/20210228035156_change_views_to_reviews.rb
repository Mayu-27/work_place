class ChangeViewsToReviews < ActiveRecord::Migration[6.0]
  def change
    rename_table :views, :reviews
  end
end
