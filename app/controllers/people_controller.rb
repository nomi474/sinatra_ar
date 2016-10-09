require 'sinatra'

	get '/people' do
		@people = Person.all
	   erb :"people/index"
	end
	
	get '/people/:id' do
		@person = Person.find(params[:id])
		birthdate_string = @person.birthdate.strftime("%m%d%Y")
		birth_path_num = Person.calculate_birth_number(birthdate_string)		
		@message = Person.message_to_display(birth_path_num)
		erb :"/people/show"
	end
	
	
	post '/people' do
		person = Person.create(first_name: params[:first_name], last_name: params[:last_name], 
						birthdate: params[:birthdate])
		redirect "/people/#{person.id}"
	end
	

