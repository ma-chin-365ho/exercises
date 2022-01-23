from common.algebra.number import Number
from common.algebra.seq_generator import SeqGenerator

def main():
    max_number = 1000000

    number = Number(max_number)

    truncatable_primes = SeqGenerator.gen_truncatable_primes(number.primes)
    print(truncatable_primes)
    print(sum(truncatable_primes))
