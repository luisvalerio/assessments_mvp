class Answer < ApplicationRecord
  belongs_to :survey_submission

  validates :text, presence: true
end
