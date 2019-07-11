class CreateTrainings < ActiveRecord::Migration[5.1]
  def change
    create_table :trainings do |t|
      t.string :name
      t.text :description
      t.text :source
      t.references :certificate, foreign_key: true

      t.timestamps
    end
  end
end
