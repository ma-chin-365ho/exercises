from common.algebra.seq_generator import SeqGenerator

def main():

      nums = SeqGenerator.gen_sum_digit_factorials_numbers()
      print(nums)
      print(sum(nums))

