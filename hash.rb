f=[ { :c => nil, :d => "J31" }, { :c => nil, :d => "F01"}, { :c => nil, :d => "F02"}, { :c => nil, :d => "F03" } ]
s=[ { :c => 12, :d => "F01", :c => 2, :d => "F02"}]

f[1..2] = s[0]


=begin
f=[{'a'=>'03 feb'}, {'b'=>'04 feb'}, {'c'=>'05 feb'}, {nil=>'06 feb'},{nil=>'07 feb'}]
s=[{'a'=>'10 feb'},{'d'=>'06 feb'},{nil=>'07 feb'}]
result=f.collect do |f_hash|
f_hash.collect do |key,value|
if key == nil
	 s.select {|s_hash| s_hash.value?(value)  }
else 
	 f_hash
end
end 
end
puts result
=end
require "delegate"
class SimpleDelegator < Delegator
  def initialize(obj)
    super                  # pass obj to Delegator constructor, required
    @delegate_sd_obj = obj # store obj for future use
  end
  def __getobj__
    @delegate_sd_obj # return object we are delegating to, required
  end

  def __setobj__(obj)
    @delegate_sd_obj = obj # change delegation object,
                           # a feature we're providing
  end
  def first_element
  	self[0]
  end
  def method_missing(m, *args, &block)
   super m, *args, &block
  end
end
s = SimpleDelegator.new [1, 2, 3, 4]
puts "first element = #{s.first_element}"
dump=s.marshal_dump()
s.__setobj__ "abcd"
puts "reverse of string abcd = #{s.reverse}"
s.marshal_load(dump)
p s.reverse
s.freeze 
#s.__setobj__ [1, 2] cannot change as its frozen

a=[1,2,3,4]
b=[2,3]
p a - b