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
	
	elements :brand_names, 'span.title-span'
	element :headers, 'div.dataTables_info'
	element :filter, '#brandsdatatable_filter input'
	sections :rows, RowContent, 'tr.odd, tr.even'
	elements :fan_growth, 'tbody [data-datapoint="lfm.audience_ratings.public_fan_acquisition_score"]'

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

	def fan_growth_sum_total
		find('th.public_fan_acquisition_score div.brand-metrics')['data-sortvalue'].to_i
	end	

	def fan_growth_values
		fan_growth.map { |value| value['title'].delete(',').to_i }.sum
	end
end
