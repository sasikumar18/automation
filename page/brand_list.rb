class RowContent < SitePrism::Section
	elements :brand_names, 'span.title-span'

	def is_available?(brand)
		brand_names.any? {|el| el.text.downcase == brand.downcase}
	end

	def brand_title
		brand_names.map(&:text)
	end
end

class BrandList < SitePrism::Page
	
	elements :menu_items, 'div.item-label'
	element :headers, 'div.dataTables_info'
	element :filter, '#brandsdatatable_filter input'
	sections :rows, RowContent, 'tr.odd, tr.even'

	def click_item(name)
		item = menu_items.find {|el| el.text == name}		
		item.click
		sleep 5
	end

	def brand?(brand)
		rows.any?{|x| x.is_available?(brand)}
	end

	def display_count
		display_title = headers.text
		display_title.gsub(/SHOWING (\d+) OF (\d+) BRANDS/, '\1')
	end

	def total_count
		total_display = headers.text
		total_display.gsub(/SHOWING (\d+) OF (\d+) BRANDS/, '\2')
	end

	def filter_by(name)
		filter.set(name)
	end
	
	def title
		data = rows.map{|el| el.brand_title }
		data.flatten
	end

	def clear_filter
		filter.set(nil)
	end
end
