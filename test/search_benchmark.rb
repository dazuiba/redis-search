require File.dirname(__FILE__)+'/test_helper'
search_count = 1000
#     user     system      total        real
# 3.160000   0.130000   3.290000 (  4.060952)    
Benchmark.bm do|x|
  x.report do
    search_count.times do|t|               
       q = "this"
       RedisSearch::Search.query('Track', q)               
    end
  end
end                                                     