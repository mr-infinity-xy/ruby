module UsefulFeatures
def class_name
self.class.to_s
end
end
class A
include UsefulFeatures
end
x = A.new
puts x.class_name