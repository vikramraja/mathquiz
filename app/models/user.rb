class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :invite_for => 2.weeks
	has_many :enrollments
	has_many :courses, :through => :enrollments

	has_many :created_quizzes, foreign_key: :creator_id, class_name: :quiz
	has_many :challenged_quizzes, foreign_key: :challenger_id, class_name: :quiz

end
