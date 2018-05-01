Rails.application.routes.draw do
  devise_for :teachers
  devise_for :students
  resources :homes
  resources :absences
  resources :grades
  resources :classes
  resources :students
  resources :subjects
  resources :teachers


  root to: 'homes_#index'
  get "znamky/:stud_id", to: "students#show_all_grades"
  get "absencie/:stud_id", to: "students#show_all_absence"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
