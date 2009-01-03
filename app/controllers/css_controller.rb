class CssController < ApplicationController
	require 'sass'
	
	def index
		sasspath = File.join(RAILS_ROOT, 'public/stylesheets/sass')
		sassfile = File.join(sasspath, params[:id].gsub(/\.css$/, '.sass'))
		sass_data = File.open(sassfile + '.sass', "r") {|f| f.read }
		@css = Sass::Engine.new(sass_data).render
		send_data @css, :type => 'text/css', :disposition => 'inline'
	end
	
end
