class AnswersController < ApplicationController
    before_action :set_answer, only: [:show]

    def create
        @question = Question.find(params[:question_id])
        @answer = @question.answers.build(answer_params)

        respond_to do |format|
            if @answer.save
                format.html { redirect_to question_path(@question) }
                format.js { flash.now[:success] = 'Respuesta agregada correctamente' }
            else
                format.html {redirect_to question_path(@question)}
                flash[:error] = 'La respuesta no se ha agregado correctamente'
            end
        end
    end

    def show
        
    end

    def destroy
        @question = Question.find(params[:question_id])
        @answer = @question.answers.find(params[:id])
        @answer.destroy
    
        respond_to do |format|
          format.html { redirect_to question_path(@question) }
          format.js
          flash[:success] = 'Respuesta eliminada correctamente'
        end
    end

    private

        def answer_params
            params.require(:answer).permit(:content, :rating).merge(user: current_user)
        end

        def set_answer
            @answer = Answer.find(params[:id])
        end

end
