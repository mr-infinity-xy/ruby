def half param
case param
when String
return param[0...param.length/2]
when Fixnum
return param/2
else
 raise TypeError, "Wrong argument type"
end
end
puts half(10)      # returns 5
puts half("abcd")  # returns ab
puts half(1.2)     # throws exception
