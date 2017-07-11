class CreateStatementCategories < ActiveRecord::Migration
  def change
    create_table :statement_categories do |t|
      t.belongs_to :statement 
      t.belongs_to :category

      t.timestamps null: false
    end
  end
end
