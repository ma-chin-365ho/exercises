from common.algebra.number import Number
from common.algebra.seq_generator import SeqGenerator

def main():
    number = Number(max_prime_number=1000000)
    circular_primes = SeqGenerator.gen_circular_primes(number.primes)
    print(len(circular_primes))
