class ClassesController < ApplicationController
  def show

  end
#edit triedy
  def update
    @triedy=Classe.find(params[:id])
    respond_to do |format|
      if @triedy.update(classes_params)
        format.html { redirect_to "/triedy/"+current_teacher.id.to_s+"", notice: 'Trieda úspešne upravená' }
        #format.json { render :show, status: :ok, location: @account }
      else
        format.html { render :edit }
        format.json { render json: @grade.errors, status: :unprocessable_entity }
      end
    end
  end
#zmazanie triedy
  def destroy
    Classe.transaction do
      @a=Classe.find(params[:id].to_i)
      @a.destroy
      respond_to do |format|
        format.html { redirect_to "/triedy/"+current_teacher.id.to_s+"", notice: 'Trieda zmazaná' }
        format.json { head :no_content }
      end
    end
  end

  private
  def classes_params
    params.require(:classe).permit(:name)
  end
end
