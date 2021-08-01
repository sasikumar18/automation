require_relative '../.././page/login_page.rb'
require_relative '../.././page/home.rb'
require_relative '../.././page/brand_list.rb'

describe 'Brands' do
	it "check brand if available", case: '3' do
		obj = LoginPage.new
		obj.load
		sleep 40
		obj.login('turneruser@turner.com', 'turnertest')
		home = HomePage.new
		home.click_item('Brands')
		page = BrandList.new
		page.brand?('Full Frontal with Samantha Bee')
		expect(page.display_count).to eq '6'
		expect(page.total_count).to eq '6'
		expect(page.title.count).to eq 6
		page.filter_by('Full Frontal with Samantha Bee')
		expect(page.title).to eq(['Full Frontal with Samantha Bee'])
		page.clear_filter
		expect(page.display_count).to eq '6'
		expect(page.total_count).to eq '6'
		expect(page.title.count).to eq 6
	end
end
