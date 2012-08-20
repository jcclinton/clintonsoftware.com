
pages = ['index', 'resume', 'projects', 'links', 'contact']

file = File.open "_templates/wrapper.html", 'rb'
wrapper = file.read

pages.each do |page|
	file = File.open "_templates/#{page}.html", 'rb'
	contents = file.read

	html = wrapper.gsub /%HTML%/, contents

	File.open "#{page}.html", 'w' do |f|
		f.write html
	end
end
