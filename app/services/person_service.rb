require 'exceptions'

class PersonService
	
	def register(user_name, email, password, padrino_code)
		raise Exceptions::DuplicateEmail.new,
			User::DUPLICATE_EMAIL if already_exits?(email) 
		raise Exceptions::InvalidPassword.new,
			User::INVALID_PASSWORD if !password_valid?(password)
		raise Exceptions::NoSuchPadrinoCode.new,
			User::NO_SUCH_PADRINO_CODE if padrino_code && !padrino_code_exits?(padrino_code) 
		
		person = Person.create(email: email, user_name: user_name, padrino_code: padrino_code, 
			password: password)

		email_manager = EmailManager.new
		email_manager.send_verification_email(person.email)

		person
	end

	def register_with_email_padrino(email,padrino)
    person_service = Person.new
    person_service.register()
  end

private 

	def already_exits?(email)
		User.find_by(email: email)
	end

	def get_message_error(id_message)
		"ASD"#TODO: encontrar el mensaje de error correspondiente, teniendo en cuenta el idioma
	end

	def password_valid?(password)
		true
	end

	def padrino_code_exits?(padrino_code)
		User.find_by(padrino_code: padrino_code)
	end

	def match_passwords(password, confirmation_pass)
    raise Exceptions::PasswordsDontMatch.new,
      get_message_error(User::PASSWORDS_DONT_MATCH) if 
      	!(password.eql? (confirmation_pass))		
	end

end