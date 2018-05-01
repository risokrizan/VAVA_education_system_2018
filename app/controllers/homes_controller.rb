class HomesController < ApplicationController
    before_action :authenticate_student!, except: [ :index]
    before_action :authenticate_teacher!, except: [ :index]

  def index
    
  end
end
