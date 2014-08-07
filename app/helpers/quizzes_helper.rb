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








  end
