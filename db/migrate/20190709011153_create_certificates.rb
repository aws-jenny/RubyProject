class CreateCertificates < ActiveRecord::Migration[5.1]
  def change
    create_table :certificates do |t|
      t.string :name
      t.text :description
      t.decimal :exam_fee
      t.boolean :isReimbursable

      t.timestamps
    end
  end
end
