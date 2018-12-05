class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.text :question_text
      t.references :survey_template, foreign_key: true
      t.integer :time_in_seconds

      t.timestamps
    end
  end
end
