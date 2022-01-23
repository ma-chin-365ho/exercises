#! ruby -Ku
p Time.now.strftime("start %H:%M:%S")

MAX_NUMBER = 2_000_000

require ("../class/NumericalSequence")

num_seq = NumericalSequence.new
num_seq.max_number = MAX_NUMBER
num_seq.create_prime_number

print("sum = ", num_seq.terms.inject(:+), "\n")

p Time.now.strftime("end %H:%M:%S")

