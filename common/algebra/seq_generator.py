from typing import List, Any, Optional
from common.algebra.subs.digit import Digit
from common.algebra.subs.list_handler import ListHandler


class SeqGenerator:

    @staticmethod
    def gen_primes(max_number : int) -> List[int]:
        """
        エラトステネスのふるい
        """
        natural_nums = list(range(2, max_number))

        prime_numbers = []
        while len(natural_nums) > 0:
            prime_number = natural_nums.pop(0)
            prime_numbers.append(prime_number)
            print(str(prime_number) + " is prime.")
            idx_natural_nums = 0
            while len(natural_nums) > idx_natural_nums:
                if natural_nums[idx_natural_nums] % prime_number == 0:
                    del natural_nums[idx_natural_nums]
                idx_natural_nums += 1

        print("primes is generated.")
        return prime_numbers

    @staticmethod
    def gen_circular_primes(primes : List[int]) -> List[int]:
        """
        circular primes 生成
        """
        circular_primes = []
        for prime in primes:
            is_circular = False
            prime_digits = Digit.cnv_digits(prime)

            # ゾロ目 (一桁もここに入る)
            if Digit.is_doublet_digits(prime_digits) == 1:
                is_circular = True
            else:
                cnt_prime_digit = len(prime_digits)
                cnt_circular_prime = 0
                for idx_circular in range(cnt_prime_digit-1):
                    start_idx = idx_circular + 1
                    circular_digits = ListHandler.sort_from_idx(prime_digits, start_idx)
                    circular_num = Digit.cnv_num_from_digits(circular_digits)
                    if circular_num in primes:
                        cnt_circular_prime += 1
                if cnt_circular_prime == (cnt_prime_digit-1):
                    is_circular = True
            
            if is_circular:
                circular_primes.append(prime)
                print(str(prime) + " is circular prime.")
        return circular_primes
