#! ruby -Ku
p Time.now.strftime("start %H:%M:%S")

# ＊シュラッシュ区切りで指定
IN_FILE_NAME = "append/18_triangle.txt"

triangle_ary = Array.new
File.foreach(IN_FILE_NAME, :encoding => Encoding::UTF_8) do |f_line|
	line_ary = f_line.strip.split("  ")
	triangle_ary.push line_ary
end



# [アルゴ]
# ① n列の隣どうし比較し、大きい方を求める。
# ② ①で求めた数字 + n-1列の数字 を求めて、待避させておく。
# ③ n列の一番左から右まで、①と②を繰り返す。
# ④ ②で待避させた数字の列をn-1列に上書きする。
# ⑤ ①から④の操作を一番したの列から一番上の列へ順番に行う。
# ⑥ ⑤終了後、1番上の列の数字が一番大きい合計値となっている。

triangle_ary.reverse!
line = triangle_ary[0]
(triangle_ary.length - 1).times do |i|
	next_line = Array.new
	j = 0
	while line.length > j + 1 do
		num1 = line[j].to_i
		num2 = line[j + 1].to_i
		top_num = triangle_ary[i+1][j].to_i
		
		if num1 >= num2 then
			next_line.push num1 + top_num
		else
			next_line.push num2 + top_num
		end
		j += 1
	end
	line = next_line
end
p line[0]

p Time.now.strftime("end %H:%M:%S")

