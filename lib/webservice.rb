require 'sinatra/base'
require 'gufm'

class Webservice < Sinatra::Application

  get '/' do
    lat, lng, year = params[:lat], params[:lng], params[:year]
    callback = params['callback'] # jsonp
    result = Gufm.new.query(lat, lng, year)
    puts "lat: #{lat.inspect}, lng: #{lng.inspect}, year: #{year.inspect} => #{result.output.inspect}"
    json = ActiveSupport::JSON.encode(result)

    if callback
      content_type :js
      "#{callback}(#{json})"
    else
      content_type :json
      json
    end
  end

end
