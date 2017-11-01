require 'bundler/setup'
require 'sinatra'
require 'sinatra/reloader'

Tilt.register Tilt::RedcarpetTemplate, 'md'

get '/' do
  @filenames = dir
  markdown :"markdown_page", :layout_engine => :erb
end

get '/*' do
  @filenames = dir
  markdown :"#{params['splat'].first}", :layout_engine => :erb
end

def dir
  Dir.glob("./views/**/*.md").map do |file_name|
    file_name.sub(%r(./views/), '').sub(%r(.md), '')
  end
end
