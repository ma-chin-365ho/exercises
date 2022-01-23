#! ruby -Ku

p Time.now.strftime("start %H:%M:%S")

require "./MathExt"

MAX_DIGIT = 1000
max_term = 10 ** MAX_DIGIT

fibonacci_ary = create_fibonacci_sequence(1,1,max_term)
# p fibonacci_ary
ans = fibonacci_ary.index {|x| x.to_s.length >= MAX_DIGIT}
p ans + 1

p Time.now.strftime("end %H:%M:%S")

