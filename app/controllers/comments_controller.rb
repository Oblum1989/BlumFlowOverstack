class CommentsController < ApplicationController
    before_action :set_comment, only: [:show]
    before_action :wh_params, only: [:create]

    def create
        respond_to do |format|
            if @comment.save
                format.js
            else
                format.html {redirect_to question_path(@question), notice: 'Relply did not save. Please try again.' }
            end
        end
    end

    def edit
    end

    def destroy 
        @question = Question.find(params[:id])   
        @comment = @question.comments.find(params[:question_id])
        @comment.destroy    
        redirect_to question_path(@question)
    end

    def show
        
    end

    private

        def comment_params
            params.require(:comment).permit(:content).merge(user: current_user)
        end

        def set_comment
            @comment = Comment.find(params[:id])
        end

        def wh_params
            if params[:question_id]
                @questionn = Question.find(params[:question_id])
                @comment = @questionn.comments.build(comment_params)
            else
                @answer = Answer.find(params[:answer_id])
                @comment = @answer.comments.build(comment_params)
            end
        end

end
