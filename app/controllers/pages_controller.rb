class PagesController < ActionController::Base
    layout "application"

    def home
        @assessments = SurveyTemplate.all # TODO Add Pagination
    end
end
