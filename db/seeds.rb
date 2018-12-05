# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

SurveyTemplate.create!(
    name: "Survey 1"
)
puts "Created Survey Template 1"

5.times do |question|
    Question.create!(
        question_text: "What would you answer to this question (#{question + 1})?",
        survey_template_id: SurveyTemplate.last.id
    )
end
puts "Created 5 questions for Survey Template 1"
