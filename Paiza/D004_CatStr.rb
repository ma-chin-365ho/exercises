input_lines = gets

in_cnt = input_lines.to_i

catstr = ""
in_cnt.times do |i|

	input_lines = gets
	
	catstr = catstr + input_lines.chomp
	if (i + 1) == in_cnt then
		catstr = catstr + "."
	else
		catstr = catstr + ","
	end
end

puts "Hello " + catstr
