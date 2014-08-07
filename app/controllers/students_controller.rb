class StudentsController < ApplicationController
	

	def create
		if User.find_by(:email => user_attributes[:email])
			flash[:alert] = "This student is already enrolled in a course."
			redirect_to assignments_path
		else
			@course= Course.find params[:course_id]
			student = User.invite!(user_attributes)
			@course.users << student
			redirect_to assignments_path
		end
	end

	private

	def user_attributes
		params.require(:user).permit(:email, :firstname).merge(:role => "student")
	end


end



