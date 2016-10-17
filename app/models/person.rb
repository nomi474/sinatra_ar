class Person < ActiveRecord::Base

	validates_presence_of :birthdate, :first_name, :last_name
	
	def self.calculate_birth_number(birthdate)
		yourBirthNumber= 0
		while birthdate.length > 1 do
			for counter in 0..birthdate.length
				yourBirthNumber += birthdate[counter].to_i
			end
				birthdate = yourBirthNumber.to_s
				yourBirthNumber = 0
		end
		 birthdate
	end
	
	def self.valid_birthdate(input)
		if input.length == 8 && input.match(/^[0-9]+[0-9]$/)
			return true
		else
			return false
		end
	end
	
	def self.message_to_display(calculated_number)
		case calculated_number.to_i
		when 1
			 "One is the leader. The number one indicates the ability to stand alone, and is a strong vibration. Ruled by the Sun."
		when 2
			 "This is the mediator and peace-lover. The number two indicates the desire for harmony. It is a gentle, considerate, and sensitive vibration. Ruled by the Moon."
		when 3
			 "Number Three is a sociable, friendly, and outgoing vibration. Kind, positive, and optimistic, Three’s enjoy life and have a good sense of humor. Ruled by Jupiter."
		when 4
			 "This is the worker. Practical, with a love of detail, Fours are trustworthy, hard-working, and helpful. Ruled by Uranus."
		when 5
			 "This is the freedom lover. The number five is an intellectual vibration. These are ‘idea’ people with a love of variety and the ability to adapt to most situations. Ruled by Mercury."
		when 6
			 "This is the peace lover. The number six is a loving, stable, and harmonious vibration. Ruled by Venus."
		when 7
			 "This is the deep thinker. The number seven is a spiritual vibration. These people are not very attached to material things, are introspective, and generally quiet. Ruled by Neptune."
		when 8
			 "This is the manager. Number Eight is a strong, successful, and material vibration. Ruled by Saturn."
		when 9
			 "This is the teacher. Number Nine is a tolerant, somewhat impractical, and sympathetic vibration. Ruled by Mars."
		else
			 "Uh oh! Your birth path number is not 1-9!"
		end
	end
	
	def self.getImage(calculated_number)
		case calculated_number.to_i
		when 1
			 "http://www.wpclipart.com/weather/sun/sun_7/sun_strong_bold.svg"
		when 2
			 "https://upload.wikimedia.org/wikipedia/commons/9/9a/Howling_at_the_Moon_in_Mississauga.jpg"
		when 3
			 "https://upload.wikimedia.org/wikipedia/commons/2/2b/Jupiter_and_its_shrunken_Great_Red_Spot.jpg"
		when 4
			 "https://upload.wikimedia.org/wikipedia/commons/3/3d/Uranus2.jpg"
		when 5
			 "https://s-media-cache-ak0.pinimg.com/originals/62/7c/be/627cbea7e2029fb64d12b2c1d40578d7.jpg"
		when 6
			 "https://upload.wikimedia.org/wikipedia/commons/8/85/Venus_globe.jpg"
		when 7
			 "https://upload.wikimedia.org/wikipedia/commons/5/56/Neptune_Full.jpg"
		when 8
			 "https://upload.wikimedia.org/wikipedia/commons/c/c7/Saturn_during_Equinox.jpg"
		when 9
			 "https://upload.wikimedia.org/wikipedia/commons/5/58/Mars_23_aug_2003_hubble.jpg"
		end
	end	
end