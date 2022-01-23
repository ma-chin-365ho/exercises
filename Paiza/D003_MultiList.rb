MAX_NUMBER = 9

input_lines = gets

in_num = input_lines.to_i

MAX_NUMBER.times do |i|

	print ((i + 1) * in_num).to_s
	if (i + 1) != MAX_NUMBER then
		print " "
	end

end
