class Frontend::UserController < ApplicationController
	def delete
		begin
			id = params[:id]
			user_service = UserService.new
			user_type = 2 #SACALO DE LA SESION PLEASE
			result = user_service.delete(id, user_type)
    rescue => e
			render json: e.message
    else  
    	render json: {result: result}
    end
	end
#Devuelve una lista con los emails de hotmail que no tenemos en nuestro sistema
  def add_contact_hotmail
    @contacts = request.env['omnicontacts.contacts']
    user_service = UserService.new
    @contact_email = user_service.contacts_hotmail_email(@contacts)
    @list_email = user_service.add_new_contacts(@contact_email)
    render json: @list_email
  end
#Devuelve una lista con los emails de gmail que no tenemos en nuestro sistema
  def add_contact_gmail
    # @contacts = request.env['omnicontacts.contacts']
    # user_service = UserService.new
    # @contact_email = user_service.contacts_gmail_email(@contacts)
    # #@list_email = user_service.add_new_contacts(@contact_email)
    # #render json: @contact_email
    # render json: @contacts
    @contacts = request.env["omniauth.auth"]
    puts "HOLA"
    render json: @contacts
  end

#Envia el email para que se registren los nuevos usuarios
  def email_register
    #TODO: Sacar codigo de padrino y mail de la sesion
    list_email = params[:list_email]
    user_service = UserService.new
    cod_padrino = user_service.get_cod_padr(user.id) #TODO: Generamos el codigo de padrino
    user_service.send_email_new_gmail_contacts(list_email,user.email,cod_padrino)
    render json: "OK"
  end

def perfil
  render json: "Perfil de usuario"
end

def publicar_twitter
  request_token_twitter
end

def publicar_facebook
  request_token_facebook
end



#TODO: Hay que saber como voy a recibir lo que el usuario quiere twittear
def request_token_twitter

  consumer = OAuth::Consumer.new(CONSUMER_KEY_TWITTER, CONSUMER_SECRET_TWITTER,
                             { :site => "https://twitter.com" })
 
 
  request_token = consumer.get_request_token(:oauth_callback => SITE + '/oauth/callback_twitter')

  session[:request_token] = request_token.token
  session[:request_token_secret] = request_token.secret

  redirect_to request_token.authorize_url(:oauth_callback => SITE + '/oauth/callback_twitter')

end

def access_token_twitter
  consumer = OAuth::Consumer.new(CONSUMER_KEY_TWITTER, CONSUMER_SECRET_TWITTER,
                               { :site => "https://twitter.com" })
  request_token = OAuth::RequestToken.new(
                  consumer,
                  session[:request_token],
                  session[:request_token_secret]
                  )

  access_token = request_token.get_access_token(:oauth_verifier=>params["oauth_verifier"])

  client = Twitter::REST::Client.new do |config|
          config.consumer_key        = CONSUMER_KEY_TWITTER
          config.consumer_secret     = CONSUMER_SECRET_TWITTER
          config.access_token        = access_token.token
          config.access_token_secret = access_token.secret
  end

  begin
    if session[:oauth_verifier] = params['oauth_verifier'] then
      write_text_twitter(client) 
    end
  rescue Exception=>ex
    puts ex.message
  end
  render json: "OK"
end

def write_text_twitter (cliente)
  texto = "Texto tweet" + " A través de JUNGLEAR® ->"
  cliente.update(texto) if texto.size<=140  
end

def request_token_facebook
  session[:oauth] = Koala::Facebook::OAuth.new(APP_ID_FACEBOOK, SECRET_FACEBOOK, SITE + "/oauth/callback_facebook")
  @@oauth = session[:oauth] #TODO: Variable estatica
  @auth_url =  session[:oauth].url_for_oauth_code(:permissions=>"publish_stream, publish_actions") 
  redirect_to @auth_url
end

def access_token_facebook
  if params[:code] then
    # acknowledge code and get access token from FB
    session[:access_token] = @@oauth.get_access_token(params[:code])
    puts [:access_token]
  end   
  # auth established, now do a graph call:
  
  @api = Koala::Facebook::API.new(session[:access_token])
  begin
    hash = Hash.new
    #photo_fb = @api.get_picture("me")
    #photo_fb = @api.put_connections("me","photo")
    #@api.put_connections("me", "feed", :message => "Fotos", photo_fb)
    #friends = @api.get_connections("me", "friends?fields=id,name,picture.type(large)")
    nombre = @api.get_object("me")
  #   nombre.each |clave,valor| do 
  #     if (valor == :name)
  #       escribir = valor
  #     end
  #   end
  #   valor = nombre[:name]
  #   puts escribir
  #   #foto = @api.get_picture("me")
  # rescue Exception=>ex
  #   puts ex.message
   end
  render json: nombre#[:first_name]#json: "OK"
end

def compartir_facebook
  url = params[:url]
  url = Googl.shorten(url)
  url = url.short_url
  url = URI.escape(url, Regexp.new("[^#{URI::PATTERN::UNRESERVED}]"))
  redirect_to COMPARTIR_FACEBOOK + "#{url}"
end

def compartir_twitter
  url = params[:url]
  titulo = params[:titulo]
  via = params[:via]

  url = Googl.shorten(url)
  url = url.short_url
  
  url = URI.escape(url, Regexp.new("[^#{URI::PATTERN::UNRESERVED}]"))
  titulo = URI.escape(titulo, Regexp.new("[^#{URI::PATTERN::UNRESERVED}]"))
  via = URI.escape(via, Regexp.new("[^#{URI::PATTERN::UNRESERVED}]"))
  redirect_to COMPARTIR_TWITTER + "#{url}&text=#{titulo}#{via}"
end

def compartir_google_plus
  url = params[:url]
  url = Googl.shorten(url)
  url = url.short_url
  url = URI.escape(url, Regexp.new("[^#{URI::PATTERN::UNRESERVED}]"))
  redirect_to COMPARTIR_GOOGLE_PLUS + "#{url}"
end


end


