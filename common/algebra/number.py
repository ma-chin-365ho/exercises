from typing import List, Any, Optional
from common.algebra.subs.file_handler import FileHandler
from common.algebra.seq_generator import SeqGenerator

class Number:

    primes : List[int] = []

    def __init__(self,
        max_prime_number : int = 0
    ):
        if max_prime_number > 0:
            self.primes = FileHandler.load_primes(max_prime_number)
            if self.primes is None:
                self.primes = SeqGenerator.gen_primes(max_prime_number)
                FileHandler.dump_primes(self.primes, max_prime_number)