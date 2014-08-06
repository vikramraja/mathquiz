class CoursesController < ApplicationController
	
	def new 
		@course = Course.new 
	end

	def create
		if params[:studentname] 
			@course = Course.new(course_params)
			if @course.save!


				@course.users << current_user

				params[:email].each_with_index do |email, i|
					student = User.invite!(email: email, firstname: params[:studentname][i], :role => "student", )
					@course.users << student
				end

					
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
		Course.find(params[:id]).destroy
    redirect_to assignments_path, :flash => { :success => "Course removed." }
	end


	private

	def course_params
      params.require(:course).permit(:name, :description)
    end

end
