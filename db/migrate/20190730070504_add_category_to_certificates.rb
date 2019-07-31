class AddCategoryToCertificates < ActiveRecord::Migration[5.1]
  def change
    add_reference :certificates, :category, foreign_key: true
  end
end
