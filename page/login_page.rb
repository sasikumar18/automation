class LoginPage < SitePrism::Page
	set_url 'https://explorer.stage.lfmprod.in/#dashboard/start'

	element :user_name, '#signInFormUsername'
	element :password, '#signInFormPassword'
	element :sign_in, 'input.btn.btn-primary.submitButton-customizable'
		
		def login(user, pass_word)
			user_name.set(user)
			password.set(pass_word)
			sign_in.click
			sleep 20
		end
end
