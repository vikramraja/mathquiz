class AssignmentsController < ApplicationController
# add before_actions to this controller

  def index
    unless current_user == nil
      binding.pry
      @firstname = current_user.firstname
      @lastname = current_user.lastname
      @courses = current_user.courses
    end
  end

  def new
    @assignment = Assignment.new
  end

  def create
    

    @assignment = Assignment.new(assignment_params)
    @assignment.creator_id = current_user.id
    @assignment.status = "open"

   


    @assignment.create_topic(operand: params[:problemtype] , difficulty: params[:difficulty] )

    @assignment.save
    redirect_to assignments_path

  end

  private

  def assignment_params
    params.require(:assignment).permit(:name, :description, :duedate, :course_id)
  end

end
