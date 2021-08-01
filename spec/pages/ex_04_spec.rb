require_relative '../.././page/login_page.rb'
require_relative '../.././page/home.rb'
require_relative '../.././page/brand_list.rb'

describe 'Check Fan Growth aggregate total' do
	it "check brand if available", case: '4' do
		obj = LoginPage.new
		obj.load
		sleep 40
		obj.login('turneruser@turner.com', 'turnertest')
		home = HomePage.new
		page = home.click_item('Brands')
		expect(page.fan_growth_values).to eq(page.fan_growth_sum_total)
	end
end 
