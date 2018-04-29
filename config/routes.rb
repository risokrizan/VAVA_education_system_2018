Rails.application.routes.draw do
  resources :homes
  devise_for :users
  resources :absences
  resources :grades
  resources :classes
  resources :students
  resources :subjects
  resources :teachers


  root to: 'homes_#index'
  get "znamky/:stud_id", to: "students#show_all_grades"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
