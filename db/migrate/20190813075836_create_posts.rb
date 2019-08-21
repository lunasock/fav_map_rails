class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|

      t.integer :user_id
      t.integer :spot_id
      t.text :review_body
      t.text :review_image_id
      t.timestamps
    end
  end
end
