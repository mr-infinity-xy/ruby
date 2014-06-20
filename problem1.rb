def problem(array, k, step)
  if array.length == 1
  	return 
  end
  puts "step:#{step}"
  array.select! { |n| n % step == 0 }
  p array
  problem(array, k, step*2)	
end
array = []
puts "Enter number of contestants"
contestants = gets.chomp.to_i
puts "Enter interval of selection"
remove_interval = gets.chomp.to_i
(1..contestants).each { |n| array << n }
problem(array, remove_interval, remove_interval )
