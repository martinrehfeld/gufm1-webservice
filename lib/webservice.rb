require 'sinatra/base'

class Webservice < Sinatra::Application

  get '/' do
    content_type :json
    '{"lang":"F-77", "status":"WIP"}'
  end

end
