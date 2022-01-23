#! ruby -Ku
p Time.now.strftime("start %H:%M:%S")

IN_FILE_NAME = "append/8_1000-digit_number.txt"
CONSECUTIVE_DISIT = 5

# データファイルを1行づつ読みこむ。
# 50桁ごとに改行コードで区切られているため、改行コードを外して連結。
str = ""
File.foreach(IN_FILE_NAME, :encoding => Encoding::UTF_8) do |f_line|
	str = str + f_line.chomp
end

# 文字列をCONSECUTIVE_DISIT桁取り出すことを繰り返し、
# その中で1文字づつ取り出して、積を計算。最大の積は保持していく。
max_product = 1
str.length.times do |i| 
	slt_str = str[i, CONSECUTIVE_DISIT]
	product = 1
	slt_str.length.times do |j|
		product = product * slt_str[j].to_i
	end
	
	if max_product < product then
		max_product = product
	end
end

print("最大値:",max_product,"\n")

p Time.now.strftime("end %H:%M:%S")

