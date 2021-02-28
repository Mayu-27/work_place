class CreateSpots < ActiveRecord::Migration[6.0]
  def change
    create_table :spots do |t|
      t.string  :shop_name,         null: false
      t.integer :genre_id,          null: false
      t.string  :address,           null: false
      t.string  :phone_number,      null: false
      t.string  :opening_hours,     null: false
      t.string  :non_business_day,  null: false
      t.float   :latitude         
      t.float   :longitude                  
      t.timestamps
    end
  end
end

