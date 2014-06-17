module A
  class Klass
  end
  X = 10
  module B;end
end

# Just to list the class(s) defined inside A
p A.constants.select { |k| A.const_get(k).instance_of? Class } # => [:Klass] 