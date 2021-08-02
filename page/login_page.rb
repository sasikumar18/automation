class LoginPage < SitePrism::Page
	set_url 'https://explorer.stage.lfmprod.in/#dashboard/start'

	element :user_name_element, '#signInFormUsername'
	element :password_element, '#signInFormPassword'
	element :sign_in, 'input.btn.btn-primary.submitButton-customizable'

	def get_user_data(user)
		file = File.read(ENV['HOME'] + '/.config.json')
		config = JSON.parse(file)
		user_data = config[user.to_s]
		email = user_data['email']
		password = user_data['password']
		[email, password]
	end

	def login(user)
		email, password = get_user_data(user)
		user_name_element.set(email)
		password_element.set(password)
		sign_in.click
		sleep 40
	end
end
