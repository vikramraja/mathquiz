class CoursesController < ApplicationController

	def new 
		@course = Course.new 
	end

	def create
		
		@course = Course.new(course_params)
		if @course.save
			# success
			binding.pry
		else
			# failure
		end
		
		student1 = User.invite!(:email => params[:student1email], 
			:name => params[:student1name], :role => "student", )

		@course.users << student1

		student2 = User.invite!(:email => params[:student2email], 
			:name => params[:student2name], :role => "student", )	

		@course.users << student2	
	end

	private

	def course_params
      params.require(:course).permit(:name, :description,)
    end

end
