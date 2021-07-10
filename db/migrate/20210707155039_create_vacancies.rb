# rails generate migration CreateVacancies
class CreateVacancies < ActiveRecord::Migration[6.1]
  def change
    create_table :vacancies do |t|
      t.string :name_profession
      t.string :free_work_places
      t.string :wage
      t.string :applicant_education
      t.string :workplace_address
      t.string :experience
      t.string :proficiency_languages
      t.string :presence_driver_license

      t.references :employer, foreign_key: true
      t.references :handbook_vacancy, foreign_key: true
      t.references :region, foreign_key: true
      t.references :education, foreign_key: true

      t.timestamps
    end
  end
end
