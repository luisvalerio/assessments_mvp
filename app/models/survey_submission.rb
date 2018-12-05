class SurveySubmission < ApplicationRecord
  belongs_to :survey_template
  has_many :answers

  validates :email, presence: true
end
