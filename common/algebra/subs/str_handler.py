import math

class StrHandler:

    def is_palindromic(s : str) -> bool:
        """
        回文
        """
        is_palindromic = True

        len_s = len(s)
        chk_char_cnt = math.floor(len_s / 2)

        for idx_s in range(len_s):
            if s[idx_s] != s[-1 * (idx_s+1)]:
                is_palindromic = False

        return is_palindromic