class CreateBillboards < ActiveRecord::Migration
  def change
    create_table :billboards do |t|
      t.string :name
      t.text :description
      t.float :latitude
      t.float :longitude
      t.boolean :gmaps

      t.timestamps
    end
  end
end
