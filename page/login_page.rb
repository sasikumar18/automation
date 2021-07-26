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



























# element :description_el, 'body > div.container > div > div.modal-content.background-customizable.modal-content-mobile.visible-xs.visible-sm > div.modal-body > div:nth-child(2) > div:nth-child(2) > div > div > span.idpDescription-customizable'
# element :brand_element, '#tab-tile-view-start-screen-1 > div > div.menu-layout > div.menu-grid > div:nth-child(1) > div > div.image > img'

# def sign_in_button_label
	# 	sign_in_button['value']
	# end

	# def description
	# 	description_el.text
	# end

	# def click_brands
	# 	byebug
	# 	click_item('Brands')
	# 	sleep 20  
	# end

	# def click_item(name)
	# 	byebug
	# 	item = menu_items.find {|x| x.text == 'Brands'}		
	# 	item.click
	# end


	# def brands
	# 	# byebug
	# 	menu_items.first.click
	# 	sleep 20  
	# end

	