require_relative '../.././page/login_page.rb'
require_relative '../.././page/home.rb'
require_relative '../.././page/brand_list.rb'

describe 'Brands' do
  it "check brand if available", case: '4' do
    obj = LoginPage.new
    obj.load
    sleep 40
    obj.login('turneruser@turner.com', 'turnertest')
    home = HomePage.new
    home.click_item('Brands')
    page = BrandList.new
    page.sum_aggregate
  end
end