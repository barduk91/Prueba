require 'date'

class User < ActiveRecord::Base

	#Company
	has_one :company

	#Person
	has_one :person

	#Follow - Followers
	has_many :follow
  has_many :followers, :through => :follow
	
	#Follow - Followings
  has_many :follow
  has_many :following, :through => :follow

	#CONSTANS
	COMPANY_TYPE = 1
	PERSON_TYPE = 2
	
	DEACTIVATION_DATE = "9999-12-31"

	#CONSTANTS_ERROR
	INVALID_PASSWORD = "000"
	No_SUCH_USER = "001"
	PASSWORDS_DONT_MATCH = "002"
	DUPLICATE_EMAIL = "004"
	NO_SUCH_PADRINO_CODE = "006"



 	before_create do
  	complete_information
  end


private 

	def complete_information
		self.own_padrino_code = "XXXX" #TODO: GENERATE PADRINO CODE
		self.registration_date = get_current_date
		self.deactivationdate =  DEACTIVATION_DATE
		return true
	end

	def get_current_date
		Date.today
	end

end
