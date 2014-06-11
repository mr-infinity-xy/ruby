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

