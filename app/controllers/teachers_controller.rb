class TeachersController < ApplicationController
  def addstudents
  	User.invite!() 
  	# get students from the view and create them as invited users. 


  end
end
