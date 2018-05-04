class HomesController < ApplicationController
    before_action :authenticate_student!, except: [ :index]
    before_action :authenticate_teacher!, except: [ :index]

  def index
    @pocet_ucitelov = ActiveRecord::Base.connection.execute("SELECT count(*) FROM teachers;")
    @pocet_studentov = ActiveRecord::Base.connection.execute("SELECT count(*) FROM students;")
  end
end
