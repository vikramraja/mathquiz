module AssignmentsHelper
end



def findStudentQuizScore(assignment_id)
	topscore = -1
	Assignment.find(assignment_id).quizzes.each do |c|
		if table_student_id == c.creator_id
			unless topscore > c.creator_score
				topscore = c.creator_score
			end
		elsif table_student_id == c.challenger_id
			unless topscore > c.challenger_score
				topscore = c.challenger_score
			end
		end

		if topscore == -1 
			return "Not Started"
		else
			return topscore.to_s
		end










end

