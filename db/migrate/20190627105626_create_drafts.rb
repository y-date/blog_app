class CreateDrafts < ActiveRecord::Migration[5.2]
  def change
    create_table :drafts do |t|
      t.integer :user_id
      t.string :title
      t.string :overview
      t.text :text
      t.text :image
      t.boolean :publish_status, default: false, null: false
      t.timestamps
    end
  end
end
