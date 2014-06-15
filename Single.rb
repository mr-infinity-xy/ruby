def read_data(source)  
  return source.read if source.respond_to?(:read)  
  return File.read(source.to_str) if source.respond_to?(:to_str)  
  raise ArgumentError  
end   
data=read_data("read.txt")
puts data
file=File.new("read.txt")
data=read_data(file)
puts data