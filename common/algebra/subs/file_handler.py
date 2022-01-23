import pickle
from typing import List, Any, Optional

class FileHandler:

    @staticmethod
    def load_primes(max_number : int) -> Optional[List[int]]:
        primes = []
        file_path = "common/algebra/data/primes_to" + str(max_number) + ".pickle"
        try:
            with open(file_path, "rb") as f:
                primes = pickle.load(f)
        except FileNotFoundError:
            print(file_path + " not found.")
            return None
        
        return primes

    @staticmethod
    def dump_primes(primes : List[int], max_number : int) -> None:
        file_path = "common/algebra/data/primes_to" + str(max_number) + ".pickle"
        with open(file_path, "wb") as f:
            pickle.dump(primes , f)
