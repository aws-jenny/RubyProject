class CreateCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :categories do |t|
      t.string :name
      t.integer :certificates_count, null: false, default: 0

      t.timestamps
    end
  end
end
