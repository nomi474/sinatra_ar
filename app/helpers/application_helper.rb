module ApplicationHelper
	def people_form_method(person)
		if person.new_record?
			@method = "post"
		else
			@method = "put"
		end
		return @method
	end
	
	def people_form_action(person)
		if person.new_record?
			@action = "/people"
		else
			@action = "/people/#{person.id}"
		end
		return @action
	end
	
	def people_form_class(person)
		if person.new_record?
			@class = "new-person"
		else
			@class = "edit-person"
		end
		return @class
	end
	
	def people_form_id(person)
		id =  params[:id]
		if person.new_record?
			@form_id = "new-person"
		else
			@form_id = "person-#{id}"
		end
		return @form_id
	end
	
=begin
	def people_form_errors(person)		
		if params[:last_name]==''
			@errors = "Incorrect last name"
		elsif params[:first_name]==''
			@errors = "Incorrect first name"	
		elsif params[:birthdate]==''
			@errors = "Incorrect birth date"	
		end
		return @errors			
	end
=end	
end