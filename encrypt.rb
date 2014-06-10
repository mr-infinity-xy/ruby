require 'openssl'
require 'digest/sha2'
require 'base64'
aes = OpenSSL::Cipher.new("AES-256-CBC")
iv = "abcde".unpack("B*").to_s

puts "Enter key"
key=gets
key = key.unpack("B*").to_s

puts "Enter file name"
fileName=gets
fileData=""
inFile=File.new(fileName.chomp!,"r")
inFile.each{ |i| fileData=fileData<<i}
#print fileData
inFile.close

aes.encrypt
aes.key = key
aes.iv = iv
encrypted_data = aes.update(fileData) + aes.final
encrypted_data=Base64.encode64(encrypted_data)
outFile=File.open(fileName<<"(copy)","w")
outFile.write(encrypted_data)
outFile.close
inFile=File.new(fileName,"r")
