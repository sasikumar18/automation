require_relative '../.././page/login_page.rb'
require_relative '../.././page/brand_list.rb'

describe 'Brands' do
  it "check brand" do
    obj = LoginPage.new
    obj.load
    sleep 40
    obj.login('turneruser@turner.com', 'turnertest')
    page = BrandList.new
    page.click_item('Brands')
    page.brand?('Full Frontal with Samantha Bee')  
  end
end
