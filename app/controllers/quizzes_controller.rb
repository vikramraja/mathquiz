class QuizzesController < ApplicationController

	def create 
		@quiz = Quiz.new()
		@quiz.creator_id = current_user.id
		@quiz.status = "open"
		@quiz.creator_score = 0
		@quiz.challenger_score = 0
		@quiz.assignment_id = params[:assignment_id]

# possiblenested route. 
# /quizzes?assignment_id = 4 
# in rails, we do quizzes_path and the arguments of this 




		# I can access the topic using @quiz.topic
		@quiz.assignment.problemnumber.times do 
			problem = Problem.new(item1: numGen(@quiz.topic), item2: numGen(@quiz.topic))
			quiz.problems << problem
		end

		while find_challenger == true
			potential_challenger = Users.where(course_id: @quiz.assignment.course_id).pluck.sample
			unless  Users.find(potential_challenger).role == "teacher"
				@quiz.challenger << Users.find(potential_challenger)
				return false

			end
		end


		# render the quiz page for the creator





	end

	def show 

		if Quiz.where(challenger_id: current_user.id) != nil
			Quiz.create

		else
			#render this other tweet. 

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


end
