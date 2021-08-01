require_relative '../.././page/login_page.rb'
require_relative '../.././page/home.rb'

describe 'user able to check brand name' do
	it "check brand", case: '2' do
		obj = LoginPage.new
		obj.load
		sleep 40
		obj.login('turneruser@turner.com', 'turnertest')
		home = HomePage.new
		home.click_item('Brands')  
	end
end
