class CoursesController < ApplicationController

	def new 
		@course = Course.new 
	end

	def create
		
		@course = Course.new(course_params)
		if @course.save
			student1 = User.invite!(:email => params[:student1email], 
			:firstname => params[:student1name], :role => "student", )

			@course.users << student1

			student2 = User.invite!(:email => params[:student2email], 
			:firstname => params[:student2name], :role => "student", )	

			@course.users << student2	
			# success

			redirect_to new_assignment_path
		else
			#this failed, and that sucks so we will
			raise
			#an exception. 
		end
		
		
	end

	def edit 
	end

	def destroy
	end


	private

	def course_params
      params.require(:course).permit(:name, :description)
    end

end
