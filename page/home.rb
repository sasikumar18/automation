require_relative './brand_list.rb'
class HomePage < SitePrism::Page

  elements :menu_items, 'div.item-label'

  def click_item(name)
    item = menu_items.find {|el| el.text == name}   
    item.click
    sleep 5
    BrandList.new
  end
end
