class SurveyTemplate < ApplicationRecord
    has_many :survey_submissions
    has_many :questions, dependent: :destroy
    accepts_nested_attributes_for :questions,
                                  allow_destroy: true,
                                  reject_if: proc { |att| att['question_text'].blank? }

    validates :name, presence: true                              

end
