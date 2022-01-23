#! ruby -Ku
p Time.now.strftime("start %H:%M:%S")

IN_FILE_NAME = "append/13_one-hundred_50-digit_numbers.txt"

# データファイルを1行づつ読みこみ数値に変換し、配列に格納。
# 50桁ごとに改行コードで区切られているため、改行コードを外して格納。
ary = Array.new
File.foreach(IN_FILE_NAME, :encoding => Encoding::UTF_8) do |f_line|
	ary.push f_line.chomp.to_i
end

p ary

# 合計する。
sum_s = ary.inject(:+).to_s

p sum_s

p sum_s[0,10]

p Time.now.strftime("end %H:%M:%S")

