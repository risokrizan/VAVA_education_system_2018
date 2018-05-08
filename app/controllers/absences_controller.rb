class AbsencesController < ApplicationController
  def show

  end
#edit absencie
  def update
    @absence=Absence.find(params[:id])
    respond_to do |format|
      if @absence.update(absence_params)
        format.html { redirect_to "/zapis_absencii/"+current_teacher.id.to_s+"", notice: 'Známka úspešne upravená' }
        #format.json { render :show, status: :ok, location: @account }
      else
        format.html { render :edit }
        format.json { render json: @grade.errors, status: :unprocessable_entity }
      end
    end
  end
  #vymazať absenciu
  def destroy
    Absence.transaction do
      @absence=Absence.find(params[:abs_id])
      @absence.destroy
      respond_to do |format|
        format.html { redirect_to "/zapis_absencii/"+current_teacher.id.to_s+"", notice: 'Známka zmazaná' }
        format.json { head :no_content }
      end
    end
  end

  private
  def absence_params
    params.require(:absence).permit(:when, :students_id, :reason)
  end
end
