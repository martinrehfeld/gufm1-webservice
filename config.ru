$:.unshift(File.join(File.dirname(__FILE__), 'lib')) unless $:.include?(File.join(File.dirname(__FILE__), 'lib'))
$stdout.sync = true

require 'webservice'

run ::Webservice.new
