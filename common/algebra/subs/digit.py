from typing import List, Any, Optional

class Digit:

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
    def cnt_digits(num : int):
        digits = Digit.cnv_digits(num)
        return len(digits)