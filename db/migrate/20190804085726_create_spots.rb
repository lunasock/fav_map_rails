class CreateSpots < ActiveRecord::Migration[5.2]
  def change
    create_table :spots do |t|
      t.integer :user_id
      t.string :spot_name
      t.integer :category
      t.string :address
      t.float :latitude
      t.float :longitude
      t.text :spot_image_id
      t.text :spot_body
      t.timestamps
    end
  end
end
