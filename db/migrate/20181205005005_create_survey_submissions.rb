class CreateSurveySubmissions < ActiveRecord::Migration[5.2]
  def change
    create_table :survey_submissions do |t|
      t.string :email
      t.references :survey_template, foreign_key: true

      t.timestamps
    end
  end
end
