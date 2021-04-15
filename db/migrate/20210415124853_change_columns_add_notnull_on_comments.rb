class ChangeColumnsAddNotnullOnComments < ActiveRecord::Migration[6.0]
  def change
    change_column :reviews, :comment, :text, null: false
  end
end
