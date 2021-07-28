require_relative '../.././page/login_page.rb'

describe 'Basic Features' do
	context "when user is logged in" do
		it "user able to login", case: '1' do
			obj = LoginPage.new
			obj.load
			sleep 40
			dashboard_url = 'https://explorer.stage.lfmprod.in/#dashboard/start'
			obj.login('turneruser@turner.com', 'turnertest')
			expect(obj.current_url).to eq(dashboard_url)
		end
	end
end
