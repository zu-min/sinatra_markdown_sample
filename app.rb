require 'bundler/setup'
require 'sinatra'
require 'sinatra/reloader'

Tilt.register Tilt::RedcarpetTemplate, 'md'

get '/*' do
  markdown :"#{params['splat'].first}"
end
