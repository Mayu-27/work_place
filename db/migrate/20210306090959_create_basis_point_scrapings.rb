class CreateBasisPointScrapings < ActiveRecord::Migration[6.0]
  def change
    create_table :basis_point_scrapings do |t|

      t.timestamps
    end
  end
end
