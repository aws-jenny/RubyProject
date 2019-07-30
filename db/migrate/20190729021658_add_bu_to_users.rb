class AddBuToUsers < ActiveRecord::Migration[5.1]
  def change
    add_reference :users, :business_unit, foreign_key: true
  end
end
