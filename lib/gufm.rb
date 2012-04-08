require 'active_support/json/encoding'

class Gufm

  attr_reader :latitude, :longitude, :year, :output

  def latitude=(lat)
    @latitude = lat.to_f
  end

  def longitude=(lng)
    @longitude = lng.to_f
  end

  def year=(yr)
    @year = yr.to_i
  end

  def query(lat, lng, yr)
    self.latitude = lat
    self.longitude = lng
    self.year = yr

    input = "#{latitude}\n#{longitude}\n#{year}\n"
    @output = IO.popen('./gufm', 'r+') do |pipe|
      pipe.write input
      pipe.close_write
      pipe.readlines
    end

    self
  end

  def as_json(options = nil)
    labels = output[-2].strip.split(/\s+/).map { |label|
      label == 'Jahr' ? 'year' : label.sub(/\(.+?\)/, '')
    }
    values = output[-1].strip.split(/\s+/).map(&:to_f)

    results = { 'lat' => latitude, 'lng' => longitude }
    results.merge!(Hash[labels.zip(values)])
    results['Year'] = year # make sure 'Year' is an Integer

    results.as_json(options)
  end

end
