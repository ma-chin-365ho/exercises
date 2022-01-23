from typing import List, Any, Optional


class ListHandler:

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