
pages = ['index', 'resume', 'projects', 'links', 'contact']

file = File.open "_templates/wrapper.html", 'rb'
wrapper = file.read

pages.each do |page|
	file = File.open "_templates/#{page}.html", 'rb'
	contents = file.read

	html = wrapper.gsub /%HTML%/, contents
	list = File.open("_templates/_list.html", 'rb').read
	list_html = ''

	pages.each do |p|
		if p == page
			sub = 'active'
		else
			sub = ''
		end

		sub_html = list.gsub /%CLASS%/, sub
		sub_html.gsub! /%NAME%/, "#{p}.html"
		sub_html.gsub! /%NAME_CAP%/, "#{p.capitalize}"

		list_html = "#{list_html}#{sub_html}"
	end

	html.gsub! /%LIST%/, list_html

	File.open "#{page}.html", 'w' do |f|
		f.write html
	end
end
