class CreateViews < ActiveRecord::Migration[6.0]
  def change
    create_table :views do |t|
      t.float      :overall_evaluation, null: false
      t.text       :comment
      t.float      :atmosphere,         null: false
      t.float      :network_stability,  null: false
      t.float      :facility,           null: false
      t.float      :congestion,         null: false
      t.float      :corona_countermeasure, null: false
      t.integer    :client_id,          null: false
      t.references :user
      t.references :spot
      t.timestamps
    end
  end
end
