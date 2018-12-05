Rails.application.routes.draw do
  resources :questions
  resources :survey_templates

  root to: 'pages#home'
  get 'begin_survey/:id', to: 'submissions#begin_survey', as: "begin_survey"
  post 'create_submission', to: 'submissions#create', as: "create_submission"

end
