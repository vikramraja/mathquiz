module QuizzesHelper

  def operandifier(operand) #outputs a string
    word =operand.downcase
    if word == "addition"
      return "+"

    elsif word == "subtraction"
      return "-"

    elsif word == "multiplication"
      return "*"
    end
  end

	def display_problem(item1, item2, operand)
		return item1.to_s + " " + operandifier(operand)+ " " + item2.to_s
	end


	def challengestatement
		@quiz = Quiz.find(params[:id])
		if current_user.id == @quiz.challenger_id 
          return User.find(@quiz.creator_id).firstname + " has challenged you! Good luck!"
        else 
          return "You have challenged " + User.find(@quiz.challenger_id).firstname + "! Good luck!"
       end 

   end









  end
