class UserService

	def delete(id, user_type)
		begin
			user = is_type_company?(user_type) ? Company.find(id) : Person.find(id)
		rescue
			raise Exceptions::NoSuchUser.new, User::No_SUCH_USER
		else
			deactivate_account(user)
			"ok"#CONSTAN PLEASE
		end
	end

	
  #Devuelve un array con los email de tus contactos de gmail
	def contacts_gmail_email(contacts)
    @hash_contactos = Hash.new
 		@contact_email = []
    contacts.each {|lista|
      lista.each {|key,value|
        if (key == :email)
          @contact_email << value
        end
      }
    }
    return @contact_email
	end

  def contacts_hotmail_email(contacts)
    @contact_email = []
    contacts.each {|contacts_hotmail_email|
      contacts_hotmail_email.each {|key,value|
        if (key == :email) && (value )
          @contact_email << value
        end
      }
    }
    return @contact_email
  end

#Busca en la tabla usuarios los email y devuelve los que ya estan -> agregar amigos
	def add_new_friends(emails)
		@list_email = []
		emails.each {|email|
			@list_email << email if already_exits?(email)
		}
    @list_email_no_friend = []
    list_email.each {|email|
      id_email = get_id_by_email(email)
      #TODO: Sacar mi id de la sesion
      if !is_friend?(id_usuario_de_la_sesion,id_email)
        @list_email_no_friend << email
      end
    }
		return @list_email_no_friend
	end

#Buscamos en la tabla usuarios los emails, devolvemos los que no esten -> invitar personas
	def add_new_contacts(emails)
		@list_email = []
		emails.each {|email|
			@list_email << email if !already_exits?(email)
		}
		return @list_email
	end

  def send_email_new_gmail_contacts(list_email,id_user,cod_padrino)
    @usuario = User.find_by(id: id_user)
    email_manager = EmailManager.new
    list_email.each {|email|}
      email_manager.send_new_contact_email(email,usuario.name,cod_padrino) 
  end

  
private

  def already_exits?(email)
    User.find_by(email: email)
  end

	def is_type_company?(user_type)
		user_type == User::COMPANY_TYPE 
	end

	def deactivate_account(user)
		user.deactivationdate = get_current_date
		user.user.deactivationdate = get_current_date #padre
		user.user.save
		user.save
	end

	def get_current_date
		Date.today
	end

  #Devolver si es amigo o no
  def is_friend?(follower_id,following_id)
    Follow.where(follower_id: follower_id).where(following_id: following_id).exists?
  end

  def get_id_by_email(email) 
    User.find_by(email: email).id
  end

end