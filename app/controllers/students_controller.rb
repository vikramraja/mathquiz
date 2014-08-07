class StudentsController < ApplicationController
	

	def create
		@course= Course.find params[:course_id]
		student = User.invite!(user_attributes)
		@course.users << student
		redirect_to assignments_path
	end

	private

	def user_attributes
		params.require(:user).permit(:email, :firstname).merge(:role => "student")
	end


end



