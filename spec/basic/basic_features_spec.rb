require_relative '../.././page/login_page.rb'
require_relative '../.././page/brand_list.rb'

describe 'Basic Features' do
  # context "when user is logged in" do

    # it "user able to login" do
    #   obj = LoginPage.new
    #   obj.load
    #   sleep 40
    #   obj.login('turneruser@turner.com', 'turnertest')
    #   expect(obj.current_url).to eq('https://explorer.stage.lfmprod.in/#dashboard/start')
    #   obj.click_brands 
    #   obj.brand?('Full Frontal with Samantha Bee')  
    # end

    it "user able to login" do
      obj = LoginPage.new
      obj.load
      sleep 40
      obj.login('turneruser@turner.com', 'turnertest')
      page = BrandList.new
      page.click_item('Brands')
      byebug
      expect(page.display_count).to eq '6'
      expect(page.total_count).to eq '6'
      expect(page.title.count).to eq '6'
      page.filter_by('Full Frontal with Samantha Bee')
      expect(page.filter_by).to eq(['Full Frontal with Samantha Bee'])
      page.clear_filter
      expect(page.display_count).to eq '6'
      expect(page.total_count).to eq '6'
      expect(page.tittle.count).to eq '6'
    end
end








# /https:\/\/auth\.lfmdev\.in\/login\?redirect_uri/

   # it "description is correct" do
    #   obj = LoginPage.new
    #   obj.load
    #   sleep 20
    #   expect(obj.description).to eq('Sign In with your social account')
    # end
 # it "click the brands" dashboard
    #   obj = LoginPage.new
    #   obj.load
    #   sleep 10  
    #   expect(obj.current_url).to eq('https://explorer.lfmdev.in/#explore/favorites/brands')
    # end



  # expect(obj.brand_selector.text).to eq("FULL FRONTAL WITH SAMANTHA BEE")






     # it "login page loaded" do
    #   obj = LoginPage.new
    #   obj.load
    #   sleep 20  
    #   expect(obj.current_url).to match(/https:\/\/auth\.lfmdev\.in\/login\?redirect_uri/)
    #   expect(obj).to have_user_name_elem
    #   expect(obj).to have_password_elem
    #   expect(obj).to have_sign_in_button
    # end
  
    # it "user able to login" do
    #   obj = LoginPage.new
    #   obj.load
    #   sleep 20
    #   obj.login('turneruser@turner.com', 'turnertest')
    #   expect(obj.current_url).to eq('https://explorer.lfmdev.in/#dashboard/start')
    # end




    # expect(obj.display_count).to eq 5
    # expect(obj.total_count).to eq 5
    # expect(obj.title.count).to eq 5
 #    obj.filter_by('Full Frontal with Samantha Bee')
 #    expect(obj.display_count).to eq 1
 #    expect(obj.total_count).to eq 5
 #    expect(obj.title).to eq(['Full Frontal with Samantha Bee'])
 #    obj.clear_filter
 #    expect(obj.display_count).to eq 5
 #    expect(obj.total_count).to eq 5
 #    expect(obj.title.count).to eq 5
