Rails.application.routes.draw do

  root to: 'vacancies#index'
  resources :regions
  resources :educations
  resources :handbook_vacancies
  resources :employers
  resources :users
  resources :vacancies
  resources :resumes

end
