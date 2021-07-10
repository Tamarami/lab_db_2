# rails generate migration CreateEducations
class CreateEducations < ActiveRecord::Migration[6.1]
  def change
    create_table :educations do |t|
      t.string :code
      t.string :name

      t.timestamps
    end
  end
end
