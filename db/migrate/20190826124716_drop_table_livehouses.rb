class DropTableLivehouses < ActiveRecord::Migration[5.2]
  def change
    drop_table :livehouses
  end
end
