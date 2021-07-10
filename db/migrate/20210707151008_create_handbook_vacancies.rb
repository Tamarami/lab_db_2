# rails generate migration CreateHandbookVacancies
class CreateHandbookVacancies < ActiveRecord::Migration[6.1]
  def change
    create_table :handbook_vacancies do |t|
      t.string :code
      t.string :name

      t.timestamps
    end
  end
end
