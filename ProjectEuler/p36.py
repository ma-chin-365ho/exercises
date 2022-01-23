from common.algebra.seq_generator import SeqGenerator

def main():
    max_number = 1000000

    palindromes_base10 = SeqGenerator.gen_palindromes(max_number, base=10)
    palindromes_base2 = SeqGenerator.gen_palindromes(max_number, base=2)

    palindromes_base_10_and_2 = set(palindromes_base10) & set(palindromes_base2)
    print(palindromes_base_10_and_2)
    print(sum(palindromes_base_10_and_2))