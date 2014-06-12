class Person  
  def c  
    puts "C called"
  end  
  def t
    puts "T called"
  end
  def p
    puts "P executed"
    self.c
  end
  protected :c
  private :t  
  public :p
end  
class R<Person
 def initialize
 
 end
 def a
  t 
 end
 def ad
   
 end
end

class G<R
 def add
   t
 end
end

Person.new.p

  
