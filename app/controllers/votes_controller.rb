class VotesController < ApplicationController
    def create
        if params[:question_id]
            @question = Question.find(params[:question_id])
            @vote = @question.votes.create(user: current_user)
            redirect_to question_path(@question)
        else
            @answer = Answer.find(params[:answer_id])
            @vote = @answer.votes.create(user: current_user)
            redirect_to question_path(@answer.question_id)
        end
    end
    
    def destroy
        if params[:question_id]
            @question = Question.find(params[:question_id])
            @question.votes.where(user: current_user).take.try(:destroy)   
            redirect_to question_path(@question) 
        else
            @answer = Answer.find(params[:answer_id])
            @answer.votes.where(user: current_user).take.try(:destroy)
            redirect_to question_path(@answer.question_id)
        end
    end

end
