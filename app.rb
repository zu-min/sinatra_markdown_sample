require 'bundler/setup'
require 'sinatra'
require 'sinatra/reloader'
require 'github/markup'

get '/' do
  @filenames = dir
  erb :top, :layout_engine => :erb

end

get '/*' do
  @filenames = dir
  file = "./views/#{params['splat'].first}"
  htmldata = GitHub::Markup.render(file, File.read(file))
  erb htmldata, :layout_engine => :erb
end

def dir
  Dir.glob("./views/**/*.md").map do |file_name|
    file_name.sub(%r(./views/), '')
  end
end
