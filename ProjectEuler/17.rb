#! ruby -Ku
p Time.now.strftime("start %H:%M:%S")
require ("../module/MathTool")
include MathTool

MAX_NUMBER = 1000
#MAX_NUMBER = 103

sum = 0
MAX_NUMBER.times do |x|
	sum += MathTool::convert_number_to_words(x + 1).gsub(/ |-/, "").length
end

p sum
p Time.now.strftime("end %H:%M:%S")

