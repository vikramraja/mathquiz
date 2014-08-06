class QuizzesController < ApplicationController

  def create
    render_quiz_id = has_existing_unfinished_quiz
    if render_quiz_id == false
      # if the current user equals a challenger id of another quiz in this assignment
      @quiz = Quiz.new
      @quiz.creator_id = current_user.id
      @quiz.status = "open"
      @quiz.challenger_status = "open"
      @quiz.creator_score = 0
      @quiz.challenger_score = 0
      @quiz.assignment_id = params[:assignment_id]
      # I can access the topic using @quiz.topic
      @quiz.save
      10.times do
        problem = Problem.create(item1: numGen(@quiz.topic), item2: numGen(@quiz.topic))
        @quiz.problems << problem
        @quiz.save
      end
      
      find_challenger = true


      while find_challenger == true
        potential_challenger = Course.find(Assignment.find(@quiz.assignment_id).course_id).users.pluck(:id).sample
        unless  User.find(potential_challenger).role == "teacher"
          @quiz.challenger = User.find(potential_challenger)
          find_challenger = false

        end
      end

      render_quiz_id = @quiz.id
    else
      @quiz = Quiz.find(render_quiz_id)

    end

    redirect_to quiz_path(@quiz)

  end


  # render the quiz page for the creator


  def show

    if Quiz.where(challenger_id: current_user.id) != nil
      Quiz.create

    else
      #render this other tweet.

    end

  end


  private

  def numGen(mytopic)
    if mytopic.difficulty == "hard"
      return rand(100...999)
    elsif mytopic.difficulty == "medium"
      return rand(10...99)
    else
      return rand(1...9)
    end



  end

  def has_existing_unfinished_quiz
    Assignment.find_by_id(params[:assignment_id]).quizzes.each do |possiblequiz|
      if possiblequiz.challenger_id = current_user.id && possiblequiz.challenger_status == "open"

        return possiblequiz.id


      end
    end
    return false
  end




end
