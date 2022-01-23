p Time.now.strftime("start %H:%M:%S")

require ("../module/MathTool")
include MathTool

#DIGIT = 2
DIGIT = 3

max_number_digit = ("9" * DIGIT).to_i
min_number_digit = ("1" + ("0" * (DIGIT - 1))).to_i

product_ary = Array.new

is_ok = false

num1 = max_number_digit
while num1 >= min_number_digit do
	num2 = max_number_digit
	while num2 >= min_number_digit do
		
		product_num = num1 * num2
		
		if MathTool::is_palindrome(product_num) then
			product_ary.push product_num
			
			#is_ok = 0
			#break
		end
		
		num2 -= 1
	end
	
	if is_ok then
		break
	end
	
	num1 -= 1
end
p product_ary.max
p Time.now.strftime("end %H:%M:%S")
