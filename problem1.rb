def problem(array, k, step)
  if array.length == 1
  	return array
  end
  array.select! { |n| n % step == 0 }
  p array
  problem(array, k, step*k)	
end
array = []
contestants = 12
remove_interval = 2
(1..contestants).each { |n| array << n }
p problem(array, remove_interval, remove_interval )
