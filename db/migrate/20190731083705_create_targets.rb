class CreateTargets < ActiveRecord::Migration[5.1]
  def change
    create_table :targets do |t|
    	t.string :fiscal_year, null: false, default: ""
    	t.references :certificate, foreign_key: true
    	t.integer :target_passers, null: false, default: 0

      t.timestamps
    end
  end
end
