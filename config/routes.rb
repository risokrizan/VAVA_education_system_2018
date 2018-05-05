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
  get "zapis_znamky/:teach_id", to: "teachers#show_teacher_grades", as: "znamky_ucitela"

  post "zapis_znamky/:teach_id", to: "teachers#add_grade"
  get "zapis_znamky/:teach_id/edit/:grade_id", to: "teachers#edit", as: "znamky_edit"
  post "zapis_znamky/:teach_id/edit/:grade_id", to: "teachers#update"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
