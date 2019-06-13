class AnswersController < ApplicationController
    before_action :set_answer, only: [:show]

    def index
        
    end

    def create
        @question = Question.find(params[:question_id])
        @answer = @question.answers.build(answer_params)

        respond_to do |format|
            if @answer.save
                format.html { redirect_to question_path(@question) }
                format.js
            else
                format.html {redirect_to question_path(@question), notice: 'Relply did not save. Please try again.' }
                format.js
            end
        end
    end

    def edit
    end

    def show
        
    end

    private

        def answer_params
            params.require(:answer).permit(:content, :rating).merge(user: current_user)
        end

        def set_answer
            @answer = Answer.find(params[:id])
        end

end
