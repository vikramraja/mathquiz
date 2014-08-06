class StudentsController < ApplicationController
	def create

		student = User.invite!(email: email, firstname: params[:studentname][i], :role => "student", )
		@course.users << student

	end

end



