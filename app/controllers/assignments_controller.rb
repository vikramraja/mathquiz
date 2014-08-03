class AssignmentsController < ApplicationController

	def new 
		@assignment = Assignment.new
	end

	def create

		@assignment = Assignment.new(assignment_params)
		@assignment.creator_id = current_user.id
		@assignment.status = "open"
		



	end



	private:

	def assignment_params
		 params.require(:assignment).permit(:name, :description, :duedate)

end
