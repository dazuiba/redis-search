require 'rubygems'          
gem 'activesupport', '=3.0.7'
require 'active_support/all'
require 'benchmark'
require 'redis'


$:.unshift(File.dirname(__FILE__)+"/../lib")          
require 'redis_search.rb'    
redis = Redis.new(:host => "127.0.0.1",:port => "6379")
redis.select("music.search")
RedisSearch.configure do |config|
 config.redis = redis
end