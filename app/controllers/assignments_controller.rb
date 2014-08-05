class AssignmentsController < ApplicationController
# add before_actions to this controller


  def index
    @courses = current_user.courses
  end

  def new
    @assignment = Assignment.new
  end

  def create

    @assignment = Assignment.new(assignment_params)
    @assignment.creator_id = current_user.id
    @assignment.status = "open"
    
    #need to connect the 
    @assignment.topic = Topic.create([{ operand: params[:problemtype] }, { difficulty: params[:problemdifficulty] }])
    @assignment.save
    redirect_to assignments_path

  end



  private

  def assignment_params
    params.require(:assignment).permit(:name, :description, :duedate)
  end


end
