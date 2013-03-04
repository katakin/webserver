# Load the rails application
require File.expand_path('../application', __FILE__)
ActiveSupport::XmlMini.backend = 'Nokogiri'
# Initialize the rails application
Webserver::Application.initialize!
