class GradesController < ApplicationController

def show

end

  def update
    @grade=Grade.find(params[:id])
    respond_to do |format|
      if @grade.update(grade_params)
        format.html { redirect_to "/zapis_znamky/"+current_teacher.id.to_s+"", notice: 'Známka úspešne upravená' }
        #format.json { render :show, status: :ok, location: @account }
      else
        format.html { render :edit }
        format.json { render json: @grade.errors, status: :unprocessable_entity }
      end
    end
  end

def destroy
  Grade.transaction do
    @grade=Grade.find(params[:grade_id])
    @grade.destroy
    respond_to do |format|
      format.html { redirect_to "/zapis_znamky/"+current_teacher.id.to_s+"", notice: 'Známka zmazaná' }
      format.json { head :no_content }
    end
  end
end

  private
  def grade_params
    params.require(:grade).permit(:value, :students_id, :subjects_id)
  end
end
