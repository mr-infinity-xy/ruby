def josephus(size, steps, survivors = 2)
  list = *1..size
 
  def list.[](i)
    fetch(i % length)
  end
 
  puts "Population #{list.length}, #{steps} steps, #{survivors} survivors"
 
  while list.length > survivors
    list.delete(list[steps-1])
    list.rotate!(steps-1)
  end
 
  puts "Position of survivors: #{list}"
end
josephus 16, 2, 1