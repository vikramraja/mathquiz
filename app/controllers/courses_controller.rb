class CoursesController < ApplicationController
	
	def new 
		@course = Course.new 
	end

	def create
		if params[:studentname] 
			@course = Course.new(course_params)
			if @course.save!


				@course.users << current_user


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
		else
			redirect_to new_course_path(name: params[:course][:name], description: params[:course][:description], 
				numstudents: params[:numstudents])
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
