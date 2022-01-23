from common.algebra.subs.digit import Digit

class NumberHandler:

    @staticmethod
    def is_pandigital(num : int, from_digit : int, to_digit : int) -> bool:
        """
        from_digit から to_digitまでの数字が1回ずつ出現する。かつ、それ以外の数字は出現しない。
        from_digit < to_digit
        """
        expect_cnt_digit = to_digit - from_digit + 1
        digits = Digit.cnv_digits(num)
        if len(digits) != expect_cnt_digit:
            return False
        for digit in digits:
            if digit < from_digit or digit > to_digit:
                return False
        for chk_digit in range(from_digit, to_digit):
            if digits.count(chk_digit) != 1:
                return False
        return True
