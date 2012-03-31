# This file contains your application, it requires dependencies and necessary parts of 
# the application.
#
# It will be required from either `config.ru` or `start.rb`

# Ruby Libs
require 'json'
require 'rubygems'

# Gems
require 'rack'
require 'ramaze'
require 'sequel'

# Make sure that Ramaze knows where you are
Ramaze.options.roots = [__DIR__]

# Load Database settings
db_settings = "{}"
File.open(__DIR__ + "/config/database_config.json", "r"){|file| db_settings = file.read}
DATABASE = Sequel.connect(JSON.parse(db_settings).merge(:adapter => 'mysql2'))

# Open Superusers
user_file = "{}"
File.open(__DIR__ + "/config/superusers.json", "r"){|file| user_file = file.read}
superusers = {} and JSON::parse(user_file).each{|k,v| superusers[k] = Digest::SHA1.hexdigest(v)}
SUPERUSERS = superusers

# Initialize controllers and models
require __DIR__('model/init')
require __DIR__('controller/init')
