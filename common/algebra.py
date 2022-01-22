from typing import List, Any, Optional
import os
import pickle

class Algebra:

    def __init__(self, max_number : int = 100):
        self.primes = self.load_primes(max_number)
        if self.primes is None:
            self.dump_primes(max_number)
            self.primes = self.load_primes(max_number)

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

    def load_primes(self, max_number : int) -> Optional[List[int]]:
        primes = []
        file_path = "common/data/primes_to" + str(max_number) + ".pickle"
        try:
            with open(file_path, "rb") as f:
                primes = pickle.load(f)
        except FileNotFoundError:
            print(file_path + " not found.")
            return None
        
        return primes
    
    def dump_primes(self, max_number : int) -> None:
        primes = self.gen_primes(max_number)
        file_path = "common/data/primes_to" + str(max_number) + ".pickle"
        with open(file_path, "wb") as f:
            pickle.dump(primes , f)

    @staticmethod
    def cnv_digits(num : int) -> List[int]:
        """
        桁 配列化
        """
        ls_str_num = list(str(num))
        digits = [int(str_num) for str_num in ls_str_num]
        return digits
    
    @staticmethod
    def cnv_num_from_digits(digits : List[int]) -> int:
        """
        桁配列を数値に変換
        """
        num = 0
        max_idx_digit = len(digits) - 1
        for idx_digits in range(max_idx_digit + 1):
            num += digits[max_idx_digit - idx_digits] * (10 ** idx_digits)
        return num

    @staticmethod
    def is_doublet_digits(digits : List[int]) -> bool:
        """
        桁がゾロ目である
        """
        if len(digits) > 0:
            if digits.count(digits[0]) == len(digits):
                return True
            else:
                return False

    @staticmethod
    def sort_from_idx(ls : List[Any], start_idx : int):
        """
        listを指定したindexから始まるように並べ変える。
        """
        new_ls = []
        len_ls = len(ls)
        for idx_ls in range(len_ls):
            cp_idx = start_idx + idx_ls
            if cp_idx >= len_ls:
                cp_idx -= len_ls
            new_ls.append(ls[cp_idx])

        return new_ls

    def gen_circular_primes(self) -> List[int]:
        """
        circular primes 生成
        """
        circular_primes = []
        for prime in self.primes:
            is_circular = False
            prime_digits = self.cnv_digits(prime)

            # ゾロ目 (一桁もここに入る)
            if self.is_doublet_digits(prime_digits) == 1:
                is_circular = True
            else:
                cnt_prime_digit = len(prime_digits)
                cnt_circular_prime = 0
                for idx_circular in range(cnt_prime_digit-1):
                    start_idx = idx_circular + 1
                    circular_digits = self.sort_from_idx(prime_digits, start_idx)
                    circular_num = self.cnv_num_from_digits(circular_digits)
                    if circular_num in self.primes:
                        cnt_circular_prime += 1
                if cnt_circular_prime == (cnt_prime_digit-1):
                    is_circular = True
            
            if is_circular:
                circular_primes.append(prime)
                print(str(prime) + " is circular prime.")
        return circular_primes
