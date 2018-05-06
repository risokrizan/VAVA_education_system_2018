class TeacherSubjectsController < ApplicationController

  def show

  end

  def update
    @tse=TeacherSubject.find(params[:id])
    respond_to do |format|
      if @tse.update(tse_params)
        format.html { redirect_to ucitel_predmety_path, notice: 'Známka úspešne upravená' }
        #format.json { render :show, status: :ok, location: @account }
      else
        format.html { render :'teachers/edit_teacher_predmet'}
        format.json { render json: @grade.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    TeacherSubject.transaction do
      @tse=TeacherSubject.find(params[:id])
      @tse.destroy
      respond_to do |format|
        format.html { redirect_to ucitel_predmety_path, notice: 'Známka zmazaná' }
        format.json { head :no_content }
      end
    end
  end

  private
  def tse_params
    params.require(:techersub).permit(:teachers_id,:subjects_id)
  end
end
