class CreateSpots < ActiveRecord::Migration[5.2]
  def change
    create_table :spots do |t|
      t.integer :user_id
      t.string :spot_name
      t.integer :category
      t.string :address
      t.decimal :latitude, precision: 20, scale: 17
      t.decimal :longitude, precision: 20, scale: 17
      t.text :spot_image_id
      t.text :spot_body
      t.timestamps
    end
  end
end
