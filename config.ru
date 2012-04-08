$:.unshift(File.dirname(__FILE__)) unless $:.include?(File.dirname(__FILE__))
$stdout.sync = true

require 'webservice'

run ::Webservice.new
