require 'sinatra/base'
require 'gufm'

class Webservice < Sinatra::Application

  get '/' do
    lat, lng, year = params[:lat], params[:lng], params[:year]
    callback = params['callback'] # jsonp
    json = ActiveSupport::JSON.encode Gufm.new.query(lat, lng, year)

    if callback
      content_type :js
      "#{callback}(#{json})"
    else
      content_type :json
      json
    end
  end

end
