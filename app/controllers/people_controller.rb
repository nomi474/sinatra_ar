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
	
	get '/people/:id/edit' do
		@person = Person.find(params[:id])
		erb :'people/edit'		
	end
	
	put '/people/:id' do
		#get the record and update the first_name and last_name here...
		person = Person.find(params[:id])
		person.birthdate = params[:birthdate]
		person.first_name = params[:first_name]
		person.last_name = params[:last_name]
		person.save
		redirect "/people/#{person.id}"
	end
	
	delete '/people/:id' do
		person = Person.find(params[:id])
		person.destroy
		redirect "/people"	
	end
	
	post '/people' do
		person = Person.create(first_name: params[:first_name], last_name: params[:last_name], 
						birthdate: params[:birthdate])
		redirect "/people/#{person.id}"
	end
	

