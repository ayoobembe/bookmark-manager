require 'sinatra'
require './lib/link'
require 'data_mapper'
require './lib/tag'

	set :views, Proc.new{File.join(root,'..','views')}
  env = ENV["RACK_ENV"] || "development"

  DataMapper.setup(:default, "postgres://localhost/bookmark_manager_#{env}")
  DataMapper.finalize
  DataMapper.auto_upgrade!

	get '/' do
	  @links = Link.all
	  erb :index
	end

	post '/links' do 
		url = params["url"]
		title = params["title"]
		tags = params["tags"].split(" ").map { |tag|
			Tag.first_or_create(:text => tag)
		}
		Link.create(:url => url, :title => title, :tags=>tags)
		redirect to('/')
	end

	get '/tags/:text' do 
		tag = Tag.first(:text => params[:text])
		@links = tag ? tag.links : []
		erb :index
	end

	

