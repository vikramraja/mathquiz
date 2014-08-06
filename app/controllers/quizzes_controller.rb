class QuizzesController < ApplicationController

	def create 
		if has_existing_unfinished_quiz == false
			# if the current user equals a challenger id of another quiz in this assignment
			@quiz = Quiz.new()
			@quiz.creator_id = current_user.id
			@quiz.status = "open"
			@quiz.challenger_status = "open"
			@quiz.creator_score = 0
			@quiz.challenger_score = 0
			@quiz.assignment_id = params[:assignment_id]
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
		end


		# render the quiz page for the creator





	end

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
		Assignments.find_by_id(params[:assignment_id]).quizzes.each do |possiblequiz|
			if possiblequiz.challenger_id = current_user.id && possiblequiz.challenger_status == "open"
			return possiblequiz.id

		else

			return false




end
