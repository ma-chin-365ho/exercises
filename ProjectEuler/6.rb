#! ruby -Ku
p Time.now.strftime("start %H:%M:%S")

MAX_NUMBER = 100

# 自然数の配列を作成
natural_number = Array.new
MAX_NUMBER.times do |x|
	natural_number.push x + 1
end

p "自然数"
p natural_number

# 自然数の2乗の配列を作成
natural_square_number = Array.new
natural_number.each do |x|
	natural_square_number.push x ** 2
end

p "自然数2乗"
p natural_square_number

print("自然数の2乗の和 ", natural_square_number.inject(:+), "\n")
print("自然数の和の2乗 ", natural_number.inject(:+) ** 2, "\n")
print("差 ", (natural_number.inject(:+) ** 2) - (natural_square_number.inject(:+)), "\n")

p Time.now.strftime("end %H:%M:%S")

