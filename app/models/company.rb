class Company < ActiveRecord::Base

	#User
	belongs_to :user


	#CONSTANTS_ROLE
	ROLE_INCOMPLETE_COMPANY = 0
	ROLE_COMPLETE_COMPANY = 1

	#CONSTANTS_COMPANY_TYPE
	COMPANY_TYPE_COMPANY = 0
	COMPANY_TYPE_FREELANCE = 1
	COMPANY_TYPE_ONLINE_COMPANY = 2

	#CONSTANTS_SECTOR TODO:AL INGLES y COMPLETAR
	SECTOR_MODA = 0
	SECTOR_TRANSPORTES = 1

	#CONSTANTS ERROR


  before_create do
  	create_user_table_and_complete_information
  end


	def add_wizard_information(company_type, description, 
      	customer_support_email, main_contact_name, number, 
      	phone_number, customer_support_phone_number, postcode, sector, 
      	secundary_email, website)

		self.company_type = company_type
		self.description = description
		self.customer_support_email = customer_support_email
		self.main_contact_name = main_contact_name
		self.number = number
		self.phone_number = phone_number
		self.customer_support_phone_number = customer_support_phone_number
		self.postcode = postcode
		self.sector = sector
		self.secundary_email = secundary_email
		self.website = website
		self.user.role = ROLE_COMPLETE_COMPANY
		self.user.save
		save
	end

private 

	def create_user_table_and_complete_information
		role = ROLE_INCOMPLETE_COMPANY 
		user_company = User.create(email: email, padrino_code: padrino_code, 
			password: password, user_type: User::COMPANY_TYPE, role: role, verified: false)
		self.user_id = user_company.id
		self.own_padrino_code = user_company.own_padrino_code
		self.registration_date = user_company.registration_date
		self.deactivationdate = user_company.deactivationdate
		self.verified = false
		return true
	end

	

end
