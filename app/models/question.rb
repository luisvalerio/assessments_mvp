class Question < ApplicationRecord
  belongs_to :survey_template

  validates :question_text, presence: true

  before_save :default_values
  def default_values
    self.time_in_seconds = 180 if self.time_in_seconds.nil?  
    # self.time_in_seconds ||= 180
  end
end
