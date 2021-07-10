# rails generate migration CreateUsers
class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :surname
      t.string :phone_number
      t.string :address
      t.string :e_mail

      t.timestamps
    end
  end
end
