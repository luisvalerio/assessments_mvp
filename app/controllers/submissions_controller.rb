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
            @survey_submission = survey_submission
            @survey_template_id = survey_submission.survey_template_id
            @questions_count = survey_submission.survey_template.questions.count
        
            # TODO update new answer
            Answer.create(
                text: params[:answer],
                survey_submission_id: survey_submission.id
            )
            # Check how many answers we already have:
            @question_index = survey_submission.answers.count
            if @question_index >= @questions_count # Go to thank you page
                redirect_to thankyou_url
            end

            # byebug
        elsif params[:email].match(valid_email_regex) # No assessment in process, create one (SurveySubmission)
            @survey_template_id = params[:survey_id]
            @questions_count = SurveyTemplate.find(params[:survey_id]).questions.count
            @question_index = 0
            survey_submission = SurveySubmission.create(
                    email: params[:email],
                    survey_template_id: params[:survey_id])
            @survey_submission = survey_submission
        else # Invalid email
                flash[:error] = "Please enter a valid email"
                redirect_to begin_survey_url(:id => params[:survey_id])
        end
    end

    def thankyou
    end
end
