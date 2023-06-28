# frozen_string_literal: true

class QuestionsController < ApplicationController
  include QuestionsAnswers
  before_action :set_question!, only: %i[show destroy edit update]

  def index
    @pagy, @questions = pagy Question.order(created_at: :desc)
    @questions = @questions.decorate
  end

  def show
    load_question_answers
  end

  def new
    @question = Question.new
  end

  def edit; end

  def create
    @question = Question.new question_create_params
    if @question.save
      flash[:success] = t('.success')
      redirect_to questions_path
    else
      render :new
    end
  end

  def update
    if @question.update question_update_params
      flash[:success] = 'Question updated!'
      redirect_to questions_path
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    flash[:success] = t('.success')
    redirect_to questions_path
  end

  private

  def question_create_params
    params.require(:question).permit(:title, :body).merge(user: current_user)
  end

  def question_update_params
    params.require(:question).permit(:title, :body)
  end

  def set_question!
    @question = Question.find params[:id]
  end
end
