class CreateAssociations < ActiveRecord::Migration[5.1]
  def change
    create_table :associations do |t|
      t.integer :certificate_id
      t.integer :associate_id

      t.timestamps
    end
  end
end
