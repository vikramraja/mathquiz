# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  role                   :string(255)      default("teacher")
#  firstname              :string(255)
#  lastname               :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default("")
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  invitation_token       :string(255)
#  invitation_created_at  :datetime
#  invitation_sent_at     :datetime
#  invitation_accepted_at :datetime
#  invitation_limit       :integer
#  invited_by_id          :integer
#  invited_by_type        :string(255)
#  invitations_count      :integer          default(0)
#

class User < ActiveRecord::Base
	after_initialize :default_values
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :invite_for => 2.weeks
	has_many :enrollments
	has_many :courses, :through => :enrollments

	has_many :created_quizzes, foreign_key: :creator_id, class_name: :quiz
	has_many :challenged_quizzes, foreign_key: :challenger_id, class_name: :quiz


	private
    def default_values
      self.role ||= "teacher"
    end

end
