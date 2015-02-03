class Frontend::PersonController < ApplicationController

	def register
		begin
			user_name = params[:user_name]
			email = params[:email]
			password = params[:password]
			padrino_code = params[:padrino_code]

			validate_params_register(user_name, email, password, padrino_code)
      person_service = PersonService.new
      @person = person_service.register(user_name, email, password, padrino_code)
    rescue => e
      render json: e.message #PUM EN EL RENDER PONES LA RUTA A TUS VISTAS (SIN EL .html.erb)
      return
    else  
      render json: { #PUM EN EL RENDER PONES LA RUTA A TUS VISTAS (SIN EL .html.erb)
      	person: @person
      } 
    end
	end


private 

end
