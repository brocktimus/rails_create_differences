class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.integer :parent_id
      t.string :full_name
      t.string :name

      t.timestamps
    end
  end
end
