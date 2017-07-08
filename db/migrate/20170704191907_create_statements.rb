class CreateStatements < ActiveRecord::Migration
  def change
    create_table :statements do |t|
      t.string :content
      t.string :headline
      t.integer :user_id
      t.integer :event_id

      t.timestamps null: false
    end
  end
end
