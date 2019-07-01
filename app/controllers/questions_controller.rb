class QuestionsController < ApplicationController
    before_action :set_question, only: [:show]

    def index
        @questions = Question.all.order(created_at: :asc) 
        if params[:search]
            @search_term = params[:search]
            @questions = Question.question_search_by(@search_term) 
        end
    end

    def new
        @question = Question.new
    end

    def create
        @question = Question.new(question_params)
        @question.user = current_user
        
        if @question.save 
            flash[:success] = 'La pregunta ha sido guardada exitosamente'
            redirect_to questions_path
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

    def destroy
        
        @question = Question.find(params[:id])
        @question.destroy
    
        respond_to do |format|
          format.html { redirect_to question_path }
          format.js
          flash[:success] = 'Respuesta eliminada correctamente'
        end
    end

    private

        def question_params
            params.require(:question).permit(:user_id, :title, :content, :rating)
        end

        def set_question
            @question = Question.find(params[:id])
        end

end
