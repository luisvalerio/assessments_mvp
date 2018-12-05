class SubmissionsController < ApplicationController
    def begin_survey
        template_id = params[:id]
        survey_template = SurveyTemplate.exists?(template_id) ? SurveyTemplate.find(template_id) : nil
        unless survey_template.nil?
            @survey_template = survey_template
            @survey_template_id = template_id
        else
            render :text => 'Not Found', :status => '404'
        end
    end

    def create

        valid_email_regex = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

        if params[:submission_id] # Working with an ongoing assessment
            survey_submission = SurveySubmission.find(params[:submission_id])
            # TODO update new answer
        elsif params[:email].match(valid_email_regex) # No assessment in process, create one (SurveySubmission)
            SurveySubmission.create(
                    name: params[:email],
                    survey_template_id: params[:survey_id])
        else # Invalid email
                flash[:error] = "Please enter a valid email"
                redirect_to begin_survey_url(:id => params[:survey_id])
        end
    end
end
