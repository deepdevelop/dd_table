require 'active_record'
require 'factory_girl'
require 'action_view'

ActiveRecord::Base.establish_connection adapter: "sqlite3",
                                        database: ":memory:"

load File.dirname(__FILE__) + '/schema.rb'
require File.dirname(__FILE__) + '/models.rb'
require File.dirname(__FILE__) + '/factories.rb'

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'fp_table'

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
end