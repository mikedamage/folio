desc "Convert Sass Files to CSS"
task :sass do
	require 'sass/engine'
	sass_dir = File.join(RAILS_ROOT, "public/stylesheets/sass/")
	
	Dir[sass_dir + "*.sass"].each do |file|
		css_code = File.open(file, "r") {|f| Sass::Engine.new(f.read).to_css }
		css_file = File.join(File.join(File.dirname(file), "../"), File.basename(file).gsub(/\.sass$/, ".css"))
		File.open(css_file, "w") {|f| f.write(css_code) }
		puts File.basename(file) + " => " + File.basename(css_file)
	end
end