require 'sinatra'

get '/' do
	erb :form
end

post '/' do
	
	birthdate = params[:birthdate]
	if Person.valid_birthdate(birthdate)
		birth_path_num = Person.calculate_birth_number(params[:birthdate])
		redirect "/message/#{birth_path_num}"
	else
		erb :form
		@error = "Sorry, your input was invalid. Try again."
	end
    
end

get '/message/:birth_path_num' do
	birth_path_num = params[:birth_path_num].to_i
	@message= Person.message_to_display(birth_path_num)
	erb :index
end

