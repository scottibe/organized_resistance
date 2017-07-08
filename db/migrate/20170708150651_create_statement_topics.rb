class CreateStatementTopics < ActiveRecord::Migration
  def change
    create_table :statement_topics do |t|
      t.integer :staement_id
      t.integer :topic_id

      t.timestamps null: false
    end
  end
end
