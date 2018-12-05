class SubmissionsController < ApplicationController
    def begin
        template_id = params[:id]
        survey_template = SurveyTemplate.exists?(2) ? SurveyTemplate.find(2) : nil
        unless survey_template.nil?
            @survey_template = survey_template
        else
            render :text => 'Not Found', :status => '404'
        end
    end

    def create
        para
    end

    private

    def submission_params
      # params.require(:).permit(:title, :body, :topic_id, :status)
    end
end
