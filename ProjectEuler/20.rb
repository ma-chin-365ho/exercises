#! ruby -Ku
p Time.now.strftime("start %H:%M:%S")

require("../module/MathTool")
include MathTool

NUMBER = 100

factorial = MathTool::calculate_factorial(NUMBER)

sum = 0
factorial.to_s.split(//).each do |c|
	sum += c.to_i
end

p factorial
p sum

p Time.now.strftime("end %H:%M:%S")

