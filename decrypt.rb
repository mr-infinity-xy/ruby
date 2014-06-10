require 'openssl'
require 'base64'

aes = OpenSSL::Cipher.new("AES-256-CBC")
iv = "abcde".unpack("B*").to_s

puts "Enter key"
key=gets
key = key.unpack("B*").to_s

puts "Enter file name"
fileName=gets
fileData=""
inFile=File.new(fileName.chomp!+"(copy)","r")
inFile.each{ |i| fileData=fileData<<i}
fileData = Base64.decode64(fileData)
inFile.close

aes.decrypt
aes.key = key
aes.iv = iv
decrypted_data = aes.update(fileData) + aes.final

outFile=File.new(fileName,"w")
outFile.write decrypted_data
outFile.close
File.delete("#{fileName}"+"(copy)")