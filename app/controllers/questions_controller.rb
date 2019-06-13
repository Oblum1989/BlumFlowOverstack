class QuestionsController < ApplicationController
    before_action :set_question, only: [:show]

    def index
        @questions = Question.all.order(created_at: :asc) 
    end

    def new
        @question = Question.new
    end

    def create
        @question = Question.new(question_params)
        @question.user = current_user
        
        if @question.save 
            redirect_to questions_path, notice: "La pregunta ha sido guardada exitosamente"
        else
            flash[:alert] = "La pregunta no ha sido guardada, por favor repetir la operacion"
            render :new
        end
    end

    def edit
    end

    def show
        @answer = Answer.new
        # @comment = @question.comments.new

    end

    private

        def question_params
            params.require(:question).permit(:user_id, :title, :content, :rating)
        end

        def set_question
            @question = Question.find(params[:id])
        end

end
