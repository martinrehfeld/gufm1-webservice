require 'sinatra/base'
require 'gufm'

class Webservice < Sinatra::Application

  before do
    content_type :json
  end

  get '/' do
    lat, lng, year = params[:lat], params[:lng], params[:year]
    ActiveSupport::JSON.encode Gufm.new.query(lat, lng, year)
  end

end
