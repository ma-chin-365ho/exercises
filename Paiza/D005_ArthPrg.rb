MAX_NUMBER = 10

input_lines = gets
input_ary = input_lines.split(" ")

first_num = input_ary[0].to_i
diff_num = input_ary[1].to_i

pr_num = first_num
MAX_NUMBER.times do |i|

	print pr_num.to_s
	if (i + 1) != MAX_NUMBER then
		print " "
	end

	pr_num = pr_num + diff_num
end

