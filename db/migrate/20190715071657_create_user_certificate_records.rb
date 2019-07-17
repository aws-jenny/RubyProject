class CreateUserCertificateRecords < ActiveRecord::Migration[5.1]
  def change
    create_table :user_certificate_records do |t|
      t.references :user, foreign_key: true
      t.references :certificate, foreign_key: true
      t.string :status, null: false, default: "Ongoing"

      t.timestamps
    end
  end
end
