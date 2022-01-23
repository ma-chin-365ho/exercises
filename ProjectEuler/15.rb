#! ruby -Ku
p Time.now.strftime("start %H:%M:%S")

require("../module/MathTool")
include MathTool

LENGTH_V = 20
LENGTH_H = 20

# �E��� LENGTH_H �Ɖ���� LENGTH_V �����킹�����ו��Ƃ��čl����B
arrange_count = MathTool::calculate_factorial(LENGTH_H + LENGTH_V)
right_arrow_arrange_count = MathTool::calculate_factorial(LENGTH_H)
bottom_arrow_arrange_count = MathTool::calculate_factorial(LENGTH_V)

p arrange_count / right_arrow_arrange_count / bottom_arrow_arrange_count

p Time.now.strftime("end %H:%M:%S")

