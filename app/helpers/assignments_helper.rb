module AssignmentsHelper
  def findStudentQuizScore(assignment_id,student_id)
    logger.debug "Started findStudentQuizScore"
    topscore = -1
    table_student_id = student_id
    Assignment.find(assignment_id).quizzes.each do |c|
      logger.debug "started quizzes.each loop"
      if table_student_id == c.creator_id
        unless topscore > c.creator_score
          topscore = c.creator_score
        end
      elsif table_student_id == c.challenger_id
        unless topscore > c.challenger_score
          topscore = c.challenger_score
        end
      end
      logger.debug "topscore is currently #{topscore}"
    end

    if topscore == -1
      return "Not Started"
    else
      return topscore.to_s + "/" + 10.to_s
    end

  end
end
