class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.string :text
      t.references :survey_submission, foreign_key: true

      t.timestamps
    end
  end
end
