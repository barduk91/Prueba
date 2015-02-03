
class EmailManager

	def send_verification_email(to)
		from = "jonathandelasen@gmail.com"
		subject = "Verification"
		body = "Hey haz click en el link para verificar tu cuenta"
		email = Email.new(from, to, subject, body)
		begin
			email.send
		rescue
			raise Exceptions::ErrorSendingEmail.new, Email::ERROR_SENDING_EMAIL
		end
	end

	def send_new_contact_email(to,name_user,cod_padrino)
		from = "junglear@junglear.com"
		subject = "Invitacion para unirte a la Jungla"
		body = name_user +  " te ha invitado a Junglear, haz click en el link siguiente para unirte a la jungla" + "http://localhost:3000/frontend/user/register" + cod_padrino
		email = Email.new(from, to, subject, body)
		begin
			email.send
		rescue
			raise Exceptions::ErrorSendingEmail.new, Email::ERROR_SENDING_EMAIL
		end
	end


end