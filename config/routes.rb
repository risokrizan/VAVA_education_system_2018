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
  resource :teacher_subjects


  root to: 'homes_#index'
  get "znamky/:stud_id", to: "students#show_all_grades"
  get "absencie/:stud_id", to: "students#show_all_absence"
  get "zapis_znamky/:teach_id", to: "teachers#show_teacher_grades", as: "znamky_ucitela"
  get "zapis_absencii/:teach_id", to: "teachers#show_all_absences", as: "vypis_absencii_ucitel"

  post "zapis_znamky/:teach_id", to: "teachers#add_grade"
  get "zapis_znamky/:teach_id/edit/:grade_id", to: "teachers#edit", as: "znamky_edit"
  post "zapis_absencii/:teach_id", to: "teachers#add_absence"
  get "zapis_absencii/:teach_id/edit/:abs_id", to: "teachers#edit_absence", as: "absencie_edit"
  delete "zapis_znamky/:teach_id", to: "grades#destroy"
  delete "zapis_absencii/:teach_id", to: "absences#destroy"
  delete "triedy/:teach_id", to: "classes#destroy"
  get "triedy/:teach_id", to: "teachers#all_classes", as: "vsetky_triedy"
  get "triedy/:teach_id/edit/:class_id", to: "teachers#edit_triedy", as: "class_edit"
  post "triedy/:teach_id", to: "teachers#add_classes"
  get "triedy/:teach_id/:class_id",  to:"teachers#class_detail", as: "class_detail"
  get "triedy/:teach_id/:class_id/edit/:stud_id", to:"teachers#edit_triedy_ziaka", as: "student_class_edit"
  get "ucitelia", to:"teachers#teachers_managment", as: "ucitelia_home"
  get "ucitelia/:id", to: "teachers#rozcestnik", as: "rozcestnik_pre_ucitelov"
  get "ucitelia/:id/predmety", to: "teachers#ucitel_predmety", as: "ucitel_predmety"
  get "ucitelia/:id/triedy", to: "teachers#ucitel_triedy", as: "ucitel_triedy"
  post "ucitelia/:id/predmety", to: "teachers#add_subject_teacher", as: "ucitel_add_triedy"
  get "vysvedcenie/:student_id/", to:"teachers#download_report"
  delete "ucitelia/:id/predmety", to: "teachers#destroy_teacher_subject"
  delete "ucitelia/:id/triedy", to: "teachers#destroy_teacher_classe"
  post "ucitelia/:id/triedy", to: "teachers#add_class_teacher"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
