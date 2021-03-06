#! ruby -Ku
p Time.now.strftime("start %H:%M:%S")

require("../module/MathTool")
include MathTool

LENGTH_V = 20
LENGTH_H = 20

# 右矢印 LENGTH_H 個と下矢印 LENGTH_V 個を合わせた並べ方として考える。
arrange_count = MathTool::calculate_factorial(LENGTH_H + LENGTH_V)
right_arrow_arrange_count = MathTool::calculate_factorial(LENGTH_H)
bottom_arrow_arrange_count = MathTool::calculate_factorial(LENGTH_V)

p arrange_count / right_arrow_arrange_count / bottom_arrow_arrange_count

p Time.now.strftime("end %H:%M:%S")

