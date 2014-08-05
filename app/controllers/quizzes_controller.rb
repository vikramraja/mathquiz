class QuizzesController < ApplicationController

	def create 
		@quiz = Quiz.new()
		@quiz.creator_id = current_user.id
		@quiz.status = "open"
		@quiz.creator_score = 0
		@quiz.challenger_score = 0
		@quiz.assignment_id = params[:assignment]
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

	def play

		Quiz.create


		# render the quiz page for the creator





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


end
