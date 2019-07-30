class CreateBusinessUnits < ActiveRecord::Migration[5.1]
  def change
    create_table :business_units do |t|
      t.string :name, null: false, default: ""
      t.integer :users_count, null: false, default: 0
      t.timestamps
    end
  end
end
