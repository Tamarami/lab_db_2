# rails generate migration CreateResumes
class CreateResumes < ActiveRecord::Migration[6.1]
  def change
    create_table :resumes do |t|
      t.string :applicant_surname
      t.string :name
      t.string :middle_name
      t.string :year_birth
      t.string :gender
      t.string :region_residence
      t.string :address
      t.string :applicant_education
      t.string :phone
      t.string :applicant_email
      t.string :desired_work
      t.string :desired_wage
      t.string :profession_position
      t.string :experience
      t.string :proficiency_languages
      t.string :presence_driver_license

      t.references :user, foreign_key: true
      t.references :region, foreign_key: true
      t.references :handbook_vacancy, foreign_key: true
      t.references :education, foreign_key: true

      t.timestamps
    end
  end
end
