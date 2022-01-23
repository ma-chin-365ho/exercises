from typing import List, Any, Optional
import math
from common.algebra.subs.digit import Digit
from common.algebra.subs.list_handler import ListHandler
from common.algebra.subs.number_handler import NumberHandler


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

    @staticmethod
    def gen_n_digit_numbers(n : int) -> Optional[List[int]]:
        """
        n桁の数字の数列
        """
        if n > 0:
            return list(range(10 ** (n-1), 10 ** n))
        else:
            return None

    @staticmethod
    def gen_pandigital_products(pandigital_from_digit, pandigital_to_digit, d_multiplicand, d_multiplier):
        """
        A * B = C がpandigitalになる積の数列

        d_multiplicand, d_multiplier : 桁数
        """
        cnt_product_digits = (pandigital_to_digit - pandigital_from_digit + 1) - d_multiplicand - d_multiplier
        nums_multiplicand = SeqGenerator.gen_n_digit_numbers(d_multiplicand)
        nums_multiplier = SeqGenerator.gen_n_digit_numbers(d_multiplier)

        products = []
        for num_multiplicand in nums_multiplicand:
            for num_multiplier in nums_multiplier:
                product = num_multiplicand * num_multiplier
                if Digit.cnt_digits(product) == cnt_product_digits:
                    num_con = (
                        product +
                        (num_multiplier * (10 ** cnt_product_digits)) +
                        (num_multiplicand * (10 ** (cnt_product_digits + d_multiplier)))
                    )
                    if NumberHandler.is_pandigital(num_con, pandigital_from_digit, pandigital_to_digit):
                        print(str(num_multiplicand) + " * " + str(num_multiplier) + " = " + str(product) + " (" + str(num_con) + ") is pandigital")
                        products.append(product)

        return products

    @staticmethod
    def gen_sum_digit_factorials_numbers() -> List[int]:
        """
        桁の階乗の和がそれ自身と同じになる数
        9! * 8 = 2903040 (7桁)
        9! * 7 = 2540160 (7桁) なので、7桁以上は無い。
        """
        nums = []

        for num in range(3, 10 ** 7):
            digits = Digit.cnv_digits(num)
            digit_factorials = [math.factorial(digit) for digit in digits]
            if num == sum(digit_factorials):
                nums.append(num)

        return nums