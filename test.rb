class A

  def  initialize(name,roll_no)
    @name=name  
    @roll_no=roll_no
  end

  def run
	#hash  
	#forLoop
	#reverseForLoop()	
	#lastItemInArray
	#reverseArrayPrint
	#usingEachIterator
	#printArray
	#try
	#usingWhile
	#usingIf
	#arrayManipulate
	#arrayManipulate2
  #hashPrint
  #stringManipulate
  #readFile
  #terminalIo
  fileManipulation
  end

  def fileManipulation
    inFile=File.new("read.txt","r")
    outFile=File.new("write.txt","w")
    inFile.each{
      |i|
      outFile.write i
    }   
    inFile.close
    outFile.close
    inFile=File.new("write.txt","r")
    inFile.each_byte{|i| 
      if i.chr=="a"
        print "X"
      else
        print i.chr
      end
     }
    #linearray = inFile.readlines  convert entire file to array

  end

  def terminalIo
    puts "enter two operand"
    operand1=gets
    operand2=gets
    puts "enter operator"
    operator=gets
    puts "printing operator #{operator.class}"
    operator.chomp!
    case operator
      when "+" then print "\nresult=",operand1.to_i+operand2.to_i
      when "-" then print "\nresult=",operand1.to_i-operand2.to_i
      when "*" then print "\nresult=",operand1.to_i*operand2.to_i
      when "/" then print "\nresult=",operand1.to_i/operand2.to_i
      else
        puts "operator doesn't matc"
    end
  end

  def readFile
    begin
      f=File.open("test1.rb","r")
    rescue Exception=>e
      puts e.message
    else
        puts "Execute only when no exception raised"
    ensure
      puts "final block in java"
    end  
    puts "After no file found error, this line will be printed only if exception is handled"
    
    begin
    f.each{|i| print i}
    rescue
    puts "No method each found for nil(NoMethodError)"
    end
  end

  def stringManipulate
    str="my name was rohan"
    subStr="was"
    print "index of was is ",str.index(subStr),"\n"
    str[str.index(subStr),subStr.length]="is"
    print  "replace was with is. New string is '",str,"'"

    puts "\n\n============Change str2 it will change str1 since string assignment is a refrence assignment================"
    str1="a"
    str2=str1
    str2<< "b"             #change are made to str2 refrence directly
    #use str2 +="b" which will create a new string and assign it to str2. Which will not change str1
    puts "str1=#{str1}  str2=#{str2}"
    puts "both str1 and str2 is ab but str1 should be a. This happens due to refrence assignment"

    puts "\n========Other operations=========="
    str="rohan"
    str.reverse
    print "reverse string rohan using reverse() without assignment gives ",str
    str.reverse!
    print "\nreverse string using reverse!, assigns reverse string to itself. it actually modifies itself"
    print "\nafter str.reverse! str=",str,"\n"
    str=str<<"\n"
    puts "===========chomp remove new line character========"
    print str.chomp!
    print "Next line\n"
    str="1,2,3,4"
    strArray=str.split(",")
    puts "\n\nString str=#{str}"
    puts "str converted to array using split function. strArray=#{strArray}"
    str="will wall"
    regex = Regexp.new(/w.ll/)
    match1 = regex.match(str)
    puts "\n",match1.inspect
  end

  def hashPrint
    people = {
      "torvalds"=>{"lname"=>"Torvalds", "fname"=>"Linus", "job"=>"maintainer"},
      "matsumoto"=>{"lname"=>"Matsumoto", "fname"=>"Yukihiro", "job"=>"Ruby originator"},
      "zitt"=>{"lname"=>"Litt", "fname"=>"Steve", "job"=>"troubleshooter"},
      "empty"=>{}
      }

    keys = people.keys

    for key in 0...keys.length
      print "key  : ", keys[key], "\n"
      print "lname: ", people[keys[key]]["lname"], "\n"
      print "fname: ", people[keys[key]]["fname"], "\n"
      print "job  : ", people[keys[key]]["job"], "\n"
      print "\n\n"
    end
    puts "=====Check wheathe fnae present in zitty======"
    puts people["zitt"].key?("fname")
    puts "======Check value inside zitt===="
    puts people['zitt'].value?('Steve')
    puts "======return index of steve inside zitt====="
    puts people['zitt'].index('Steve')
    
    puts "=====Print entire hash===="
    people.each do |key,value| 
      puts "\nEntery for row #{key}";
      people[key].each do |inkey,invalue| 
      print inkey,"=>",invalue,"\n"
     end
   end
   puts "\n======Check empty.======"
   puts people['empty'].empty?();
   puts "======Select only where key equals zitt====="
   puts people.select{|key,value| key=='zitt'  }
   puts "\n=======Sorting======="
   puts people.sort{|x,y| y<=>x}
   num=(2**(0.size * 8 -2) -1)
   puts num
  end

  def arrayManipulate2
  presidents = []
  presidents[0] = "aden"
  presidents[1] = "alto"
	presidents[2] = "Adams"
	presidents[3] = "Madison"
	presidents[4] = "set"
  presidents[6]=  "last"
	presidents.each {|i| print i, "\n"}
  puts "========Slice operation========"
  puts presidents[1...3]
  puts "=======Another way to slice======="
  puts presidents[1,3]
  puts "=======Replace slice======="
  presidents[1,3]=["Replace1","Replace2"]
  puts presidents
  puts "=======Add item without Replace======="
  presidents[2,0]=["Add1","Add2"]
  puts presidents
  end

  def arrayManipulate
	republicans = ["Ford", "Reagan", "Bush1", "Bush2"]
  	puts "removed element by shift = #{republicans.shift()}"                                 #remove one element from 0th position and returns it
  	puts "removed element by pop = #{republicans.pop()}"                                     #removes one element from end of array and returns it 
  	print "after adding elements by push array= ",republicans.push("push1","push2"),"\n"	 #adds items at the end of aray. returns entire array
  	print "after adding element by unshift array=",republicans.unshift("unshift1","unshift2"),"\n"		#adds items at begning of array and returns entire array
  	republicans.each{|i| puts i }
  end

  def usingIf
	democrats = ["Carter", "Clinton"]
	republicans = ["Ford", "Reagan", "Bush1", "Bush2"]
	party = ARGV[0]
	if party == nil 
		print "Argument must be \"democrats\" or \"republicans\"\n"
		print "Pleas provide command line arg"
	elsif party == "democrats"
		democrats.each { |i| print i, " "}
		print "\n"
	elsif party == "republicans"
		republicans.each { |i| print i, " "}
		print "\n"
	else
		print "All presidents since 1976 were either Democrats or Republicans\n"
	end
  end
  
  def usingWhile
  	ss=5
  	while ss > 0
	puts ss
	puts "end" if ss == 1       #if with single line
	break if ss == 1 
	ss -= 2
	end
  end

  def try
  	fruits=['apple','ball','cat','mango','camel']
  	for i in (0...fruits.length)
  		puts fruits[i]
  		i=i+5
  	end
  end

  def printArray
  	fruits=['apple','ball','cat','mango','camel']
  	puts fruits
  end

  def usingEachIterator
  	i=0;
  	fruits=['apple','ball','cat','mango','camel']
  
  	#(fruits).each {|i| 	puts i.capitalize} 
  	#puts "After i #{i}"
  	puts fruits.collect{|word| word.capitalize }
  end

  def reverseArrayPrint
  	fruits=['apple','ball','cat','mango','camel']
	for i in (0...fruits.length)
  		puts fruits[-i-1]
  	end
  end

  def lastItemInArray
  	fruits=['apple','ball','cat','mango','camel']
    puts fruits[-1]
  end
  
  def reverseForLoop
  	fruits=['apple','ball','cat','mango','camel']
  	for eachFruits in (0...fruits.length)
  		print "index=#{fruits.length-1-eachFruits} and fruits=",fruits[fruits.length-1-eachFruits],"\n"
  	end
  end

  def forLoop
  	fruits=['apple','ball','cat','dog','camel']
  	for eachFruits in (0...fruits.length)
  		print "index=#{eachFruits} and fruits=",fruits[eachFruits],"\n"
  	end
  end
  
  def hash
  	hsh = colors = { "red" => 0xf00, "green" => 0x0f0 }
  	hsh.each do |key,value|
  		print "key=>#{key} value=>#{value}\n"
  	end
  end
   attr_reader :name,:roll_no
   attr_writer :name,:roll_no
$global=100
end
class B
  @@classVariable=100
  def initialize
    
  end
  def a
    puts "instant method"
  end
  class <<self
    def classMethod
      puts @@classVariable
    end
    def a
      puts "classMethod"
    end
  end
end
B.a
puts B.singleton_methods