class CreateUserTrainingRecords < ActiveRecord::Migration[5.1]
  def change
    create_table :user_training_records do |t|
      t.boolean :isDone
      t.references :user, foreign_key: true
      t.references :training, foreign_key: true

      t.timestamps
    end
  end
end
