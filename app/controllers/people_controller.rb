	get '/people' do
		@people = Person.all
		erb :"people/index"
	end
	
	get '/people/new' do
		@person = Person.new
		erb :"/people/new"
	end
	
	post '/people' do
		if params[:birthdate].include?("/")			
			birthdate = params[:birthdate]
			birthdate.gsub('/','')
			#birthdate = birthdate[0, birthdate.length - 13] 
		#else
		#	birthdate = Date.strptime(params[:birthdate], "%m%d%Y")
		end
		@person = Person.new(first_name: params[:first_name], last_name: params[:last_name], 
						birthdate: params[:birthdate])
		if @person.valid?
			@person.save
			redirect "/people/#{@person.id}"
		else
			@errors = ''
			@person.errors.full_messages.each do |message|
				@errors = "#{@errors} #{message}."
			end # end for do loop
		end	
	end
	
	get '/people/:id' do
		@person = Person.find(params[:id])
		birthdate_string = @person.birthdate.strftime("%m%d%Y")
		birth_path_num = Person.calculate_birth_number(birthdate_string)		
		@message = Person.message_to_display(birth_path_num)
		@image = Person.getImage(birth_path_num)
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