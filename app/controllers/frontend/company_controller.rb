class Frontend::CompanyController < ApplicationController

	def register
		begin
			name = params[:name]
			email = params[:email]
			password = params[:password]
			padrino_code = params[:padrino_code]
			cif = params[:cif]

			validate_params_register(name, email, password, padrino_code, cif)
      company_service = CompanyService.new
      @company = company_service.register(name, email, password, padrino_code, cif)
    rescue => e
      render json: e.message #PUM EN EL RENDER PONES LA RUTA A TUS VISTAS (SIN EL .html.erb)
      return
    else  
    	#Guardalo en sesion please, lo necesito en el wizard
    	store_in_cache("company_id", @company.id)

      render json: { #PUM EN EL RENDER PONES LA RUTA A TUS VISTAS (SIN EL .html.erb)
      	company: @company
      } 
    end
	end

	def wizard
		begin
			company_type = params[:company_type]
			description = params[:description]
			customer_support_email = params[:customer_support_email]
			tags = params[:tags]
			main_contact_name = params[:main_contact_name]
			number = params[:number]
			phone_number = params[:phone_number]
			customer_support_phone_number = params[:customer_support_phone_number]
			postcode = params[:postcode]
			sector = params[:sector]
			secundary_email = params[:secundary_email]
			website = params[:website]

			key = "company_id"
			company_id = get_value_from_cache(key)

			validate_params_wizard(company_type, description, 
      	customer_support_email, tags, main_contact_name, number, 
      	phone_number, customer_support_phone_number, postcode, sector, 
      	secundary_email, website)
      company_service = CompanyService.new
      @company = company_service.wizard(company_id, company_type, description, 
      	customer_support_email, tags, main_contact_name, number, 
      	phone_number, customer_support_phone_number, postcode, sector, 
      	secundary_email, website)
    rescue => e
      render json: e.message #PUM EN EL RENDER PONES LA RUTA A TUS VISTAS (SIN EL .html.erb)
      #ejemplo: render :pag_error_loquesea
      return
    else  
      render json: { #PUM EN EL RENDER PONES LA RUTA A TUS VISTAS (SIN EL .html.erb)
      	company: @company
      } 
      #ejemplo: render :user/home LA CARPETA RAIZ ES views
      #ejemplo: render :company/home 
    end
	end


private

	def validate_params_register(name, email, password, padrino_code, cif)
		
	end


	def validate_params_wizard(company_type, description, 
      	customer_support_email, tags, main_contact_name, number, 
      	phone_number, customer_support_phone_number, postcode, sector, 
      	secundary_email, website)
		
	end


	def store_in_cache(key, value)
		Rails.cache.write(key, value) 
	end


	def get_value_from_cache(key)
		Rails.cache.read(key) 		
	end
end
