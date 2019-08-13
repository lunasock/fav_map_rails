class AddCategoryToLivehouse < ActiveRecord::Migration[5.2]
  def change
    add_column :livehouses, :category, :integer
    add_column :livehouses, :livehouse_image_id, :text
    add_column :livehouses, :livehouse_body, :text
  end
end
