require File.dirname(__FILE__)+'/test_helper'
require 'sequel' 

#       user     system      total        real
# 373.370000  69.160000 442.530000 (662.343683)
# copy output
# Program exited with code #0 after 698.66 seconds. 

# used_memory_human:102.57M
# total_commands_processed:4797675


doc_count = 100000                                     


dbconfig ={:host => '127.0.0.1',
            :username => 'root',
            :password => ''      ,       
            :database => 'music',      
            :encoding => 'utf8'}
DB = Sequel.mysql(dbconfig['database'], dbconfig)


tracks = DB[:tracks].limit(doc_count).all 

Benchmark.bm do|x|
  x.report do
    tracks.each do |track|                                     
        s = RedisSearch::Search.new(:title => track[:name], :id => track[:id],:exts => {:created_at=> track[:created_at]},:type => 'Track')
        s.save     
    end        
  end
end