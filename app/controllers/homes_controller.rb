class HomesController < ApplicationController
    before_action :authenticate_student!, except: [ :index]
    before_action :authenticate_teacher!, except: [ :index]
#Priprava udajov pre grafy na landing page
  def index
    @pocet_ucitelov = Teacher.all.count
    @pocet_studentov = Student.all.count
    @pocet_jednotiek = Grade.all.where(value: 1).count
    @pocet_dvojok = Grade.all.where(value: 2).count
    @pocet_trojok = Grade.all.where(value: 3).count
    @pocet_stvoriek = Grade.all.where(value: 4).count
    @pocet_patiek = Grade.all.where(value: 5).count
  end
end
