def problem(n, k)
	step = k
	while k*step < n
	step*= k 
    puts step
    end
	return step
end
array = []
puts "Enter number of contestants"
contestants = gets.chomp.to_i
puts "Enter interval of selection"
remove_interval = gets.chomp.to_i
(1..contestants).each { |n| array << n }
p problem(contestants, remove_interval)
