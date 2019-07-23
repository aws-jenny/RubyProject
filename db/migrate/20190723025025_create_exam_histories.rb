class CreateExamHistories < ActiveRecord::Migration[5.1]
  def change
    create_table :exam_histories do |t|
      t.string :examinee_code
      t.date :exam_date
      t.references :user_certificate_record, foreign_key: true

      t.timestamps
    end
  end
end
