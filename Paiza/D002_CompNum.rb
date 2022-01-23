input_lines = gets
input_ary = input_lines.split(" ")

a = input_ary[0].to_i
b = input_ary[1].to_i

if a == b then
	
	puts "eq"
elsif a > b then

	puts a.to_s
else
	
	puts b.to_s
end
