from common.algebra import Algebra

def main():
    algebra = Algebra(1000000)
    circular_primes = algebra.gen_circular_primes()
    print(len(circular_primes))
