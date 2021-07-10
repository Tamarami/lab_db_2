# rails generate migration CreateEmployers
class CreateEmployers < ActiveRecord::Migration[6.1]
  def change
    create_table :employers do |t|
      t.string :name
      t.string :contact_phone_number
      t.string :contact_person_surname
      t.string :actual_address
      t.string :contact_e_mail

      t.references :region, foreign_key: true

      t.timestamps
    end
  end
end
