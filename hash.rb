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
f1,f2,f3,f4 = /(.)(.)(\d+)(\d)/.match("THX1138.").captures

a= /(abc)+/.match("rabchabcmabcabc")
a="rabchabcmabcabc".gsub /(abc)/, "xx"
p a