# Strive Assessments-MVP

* Ruby version = 5.2.1

# Set-up instructions:

- Clone git repository
- Change into root directory of the project
- Install gems by running `bundle install`
- Depending on your database configuration, creating the database and migrating to it might be required, not necessary if using SQLite.
- Reset and Seed the database by running `rails db:reset`
- Run the server `rails s`
- Test in browser

## Commentary

For this MVP, the database was simplified into 4 models:
- ### SurveyTemplate
    * Contains a __survey_id__, a __survey name__ (used for listing the survey at the root path '/') and has many __questions__.
- ### Question
    * Contains a __question_id__, a __time_in_seconds__ (which sets the countdown timer for that particular question, if not provided it defaults to 180), a __question_text__ (which is the question that will be shown during the survey), and it belongs to a __survey_template__.  
- ### Answer
    * Contains an __answer_id__, a __text__ (which holds the text that the user sent or the string 'blank_answer' if nothing is written on the text area and either the countdown timer expires or the user clicks on submit), and it belongs to a __survey_submission__.
- ### SurveySubmission
    * Contains a __survey_submission_id__, an __email__ (which is validated on the backend to at least look like an email), it belongs to a __survey_template__ and it has many __answers__ associated with it.

The project starts at the root path '/' where a list of all the SurveyTemplates are seen. From here, one can begin a survey by clicking on it.

After completing a Survey Submission all its corresponding answers are saved to the database. 
