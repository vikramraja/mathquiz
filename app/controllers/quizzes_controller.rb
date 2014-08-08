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
        problem = Problem.create!(item1: numGen(@quiz.topic), item2: numGen(@quiz.topic))
  

        @quiz.problems << problem
      end

      find_challenger = true



      while find_challenger == true
 
        potential_challenger = Course.find(Assignment.find(@quiz.assignment_id).course_id).users.pluck(:id).sample
        if User.find(potential_challenger).role != "teacher" && potential_challenger != current_user.id
          binding.pry
          @quiz.challenger = User.find(potential_challenger)
          binding.pry
          find_challenger = false
          @quiz.save


        end

      end

      render_quiz_id = @quiz.id
    else
      @quiz = Quiz.find(render_quiz_id)

    end

    redirect_to quiz_path(@quiz)

  end



  def update
    @quiz = Quiz.find(params[:id])

    if current_user.id == @quiz.challenger_id
      @quiz.challenger_status = "closed"
    else
      @quiz.status = "closed"
    end

    logger.debug "reached the controller"
    correctanswer = []
    @quiz.problems.each_with_index do |prob, index|
      correctanswer[index] = prob.item1.send(operandifier(@quiz.topic.operand), prob.item2)
    end

    correctanswer.each_with_index do |a, index|
      if a == params[:quiz_answers][index].to_i
        if current_user.id == @quiz.challenger_id
          @quiz.challenger_score +=1
        else
          @quiz.creator_score +=1
        end
      end
    end
    @quiz.save

        redirect_to root_path
      

  end



    private

    def numGen(mytopic)
      if mytopic.difficulty.downcase == "hard"
        return rand(100...999)
      elsif mytopic.difficulty.downcase == "medium"
        return rand(10...99)
      else
        return rand(1...9)
      end
    end

    def has_existing_unfinished_quiz
      Assignment.find_by_id(params[:assignment_id]).quizzes.each do |possiblequiz|
        if possiblequiz.challenger_id == current_user.id && possiblequiz.challenger_status == "open"
          return possiblequiz.id
        end
      end
      return false
    end

    def operandifier(operand) #outputs a string
    word = operand.downcase 
    if word == "addition"
      return "+"

    elsif word == "subtraction"
      return "-"

    elsif word == "multiplication"
      return "*"
    end
  end

    # def whatAmI(quiz)

    #   if current_user.id == @quiz.challenger_id
    #     return "challenger"
    #   else
    #     return "creator"
    #   end
    # end

    # def whoAmI(quiz)
    #   binding.pry
    #   if current_user.id == quiz.challenger_id
    #     return quiz.challenger_id
    #   else
    #     return quiz.creator_id
    #   end
    # end

    # def whoAmI_status(quiz)

    # end

    # def whoAmI_score(quiz)
    #   if current_user.id == quiz.challenger_id
    #     return quiz.challenger_score
    #   else
    #     return quiz.creator_score
    #   end
    # end




  end
