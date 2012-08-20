
pages = ['index', 'resume', 'projects', 'links', 'contact']
main = 'index'
path = "_templates/"

file = File.open "#{path}wrapper.html", 'rb'
wrapper = file.read

pages.each do |page|
	contents = File.open("#{path}#{page}.html", 'rb').read

	contents = "<div class=\"container\">#{contents}</div>"
	html = wrapper.gsub /%HTML%/, contents

	list = File.open("#{path}_list.html", 'rb').read
	list_html = ''

	pages.each do |p|
		sub = if p == page then 'active' else '' end

		sub_html = list.gsub /%CLASS%/, sub
		sub_html.gsub! /%NAME%/, "#{p}.html"
		sub_html.gsub! /%NAME_CAP%/, "#{p.capitalize}"

		list_html = "#{list_html}#{sub_html}"
	end

	html.gsub! /%LIST%/, list_html
	title = if page != main then "#{page.capitalize} | " else '' end
	html.gsub! /%TITLE%/, title

	File.open "#{page}.html", 'w' do |f|
		f.write html
	end
end
