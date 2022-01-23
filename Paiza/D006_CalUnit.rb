input_lines = gets
input_ary = input_lines.split(" ")

num = input_ary[0].to_i
unit = input_ary[1]

if unit == "km" then
	puts num * 1000000
elsif unit == "m" then
	puts num * 1000
elsif unit == "cm" then
	puts num * 10
end

