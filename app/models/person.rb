class Person < ActiveRecord::Base

	#User
	belongs_to :user

	#CONSTANS
	ROLE_PERSON = 3

	#CONSTANTS ERROR


  before_create do
  	create_user_table_and_complete_information
  end


private 

	def create_user_table_and_complete_information
		role = ROLE_PERSON
		user_person = User.create(email: email, padrino_code: padrino_code, 
			password: password, user_type: User::PERSON_TYPE, verified: false, role: ROLE_PERSON)
		self.user_id = user_person.id
		self.own_padrino_code = user_person.own_padrino_code
		self.registration_date = user_person.registration_date
		self.deactivationdate = user_person.deactivationdate
		self.role = role
		self.verified = false
		return true
	end

end
