class CreateLivehouses < ActiveRecord::Migration[5.2]
  def change
    create_table :livehouses do |t|
      t.string :livehouse_name
      t.string :address
      t.float :latitude
      t.float :longitude
      t.timestamps
    end
  end
end
