#! ruby -Ku
p Time.now.strftime("start %H:%M:%S")

require("../module/MathTool")
include MathTool

LENGTH_V = 20
LENGTH_H = 20

# ‰E–îˆó LENGTH_H ŒÂ‚Æ‰º–îˆó LENGTH_V ŒÂ‚ğ‡‚í‚¹‚½•À‚×•û‚Æ‚µ‚Äl‚¦‚éB
arrange_count = MathTool::calculate_factorial(LENGTH_H + LENGTH_V)
right_arrow_arrange_count = MathTool::calculate_factorial(LENGTH_H)
bottom_arrow_arrange_count = MathTool::calculate_factorial(LENGTH_V)

p arrange_count / right_arrow_arrange_count / bottom_arrow_arrange_count

p Time.now.strftime("end %H:%M:%S")

