require 'sinatra/base'
require 'link'   #I'm guessing this is how you require the models?

# class BookmarkManager < Sinatra::Base
#   get '/' do
#     'Hello BookmarkManager!'
#   end

  env = ENV["RACK_ENV"] || "development"
  #we're telling datamapper to use a postgres database on localhost. The name will ba bookmar_manager_test
  #or bookmark_manager_development, depending on the environnment
  DataMapper.setup(:default, "postgres://localhost/bookmark_manager_#{env}")

  require './lib/link' # this needs to be done after datamapper is initialised
  # require 'data_mapper'

  #After declaring your models, you should finalise them
  DataMapper.finalize

  #However, the database tables don't exist yet. Let's tell datamapper to create them
  DataMapper.auto_upgrade!

  # start the server if ruby file executed directly
  # run! if app_file == $0
# end
