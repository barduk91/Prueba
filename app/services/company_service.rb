require 'exceptions'

class CompanyService
	
	def register(name, email, password, padrino_code, cif)
		raise Exceptions::DuplicateEmail.new,
			User::DUPLICATE_EMAIL if already_exits?(email) 
		raise Exceptions::InvalidPassword.new,
			User::INVALID_PASSWORD if !password_valid?(password)
		raise Exceptions::NoSuchPadrinoCode.new,
			User::NO_SUCH_PADRINO_CODE if padrino_code && !padrino_code_exits?(padrino_code) 

		company = Company.create(email: email, name: name, padrino_code: padrino_code, 
			password: password, cif: cif)
		company
	end

	def wizard(id_company, company_type, description, 
    customer_support_email, tags, main_contact_name, number, 
    phone_number, customer_support_phone_number, postcode, sector, 
    secundary_email, website)
		#TODO: OPERAR TAGS

		company = Company.find id_company
		company.add_wizard_information(company_type, description, 
      customer_support_email, main_contact_name, number, 
      phone_number, customer_support_phone_number, postcode, sector, 
      secundary_email, website)

		email_manager = EmailManager.new
		email_manager.send_verification_email(company.email)

    company		
	end

private 

	def already_exits?(email)
		User.find_by(email: email)
	end

	def password_valid?(password)
		true
	end

	def padrino_code_exits?(padrino_code)
		User.find_by(padrino_code: padrino_code)
	end

	def get_message_error(id_message)
		"ASD"#TODO: encontrar el mensaje de error correspondiente, teniendo en cuenta el idioma
	end
	
	def match_passwords(password, confirmation_pass)
    raise Exceptions::PasswordsDontMatch.new,
      get_message_error(User::PASSWORDS_DONT_MATCH) if 
      	!(password.eql? (confirmation_pass))		
	end
	

end