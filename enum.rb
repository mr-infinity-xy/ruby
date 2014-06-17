class Family
  attr_accessor :father, :surname, :mother, :child

  include Enumerable
  def each
    yield "#{@father} #{@surname}"
    yield "#{@mother} #{@father} #{surname}"
    yield "#{@child} #{@father} #{surname}"
  end
end
f = Family.new
f.father = 'father_name'
f.surname= 'surname'
f.mother = 'mother_name'
f.child = 'child_name'

puts f.map{|f| "Family member: #{f}" }
p f.detect{ |f| f== "father_name surname" }
p f.select{ |f| f[0]=="f" || f[0]=="m" }
p f.sort{|x,y| y<=>x}