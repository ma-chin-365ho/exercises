from common.algebra.seq_generator import SeqGenerator

def main():
    """
    桁数
    1 * 1 = 7   : ない 9 * 9
    1 * 2 = 6   : ない 9 * 99
    2 * 2 = 5   : ない 99 * 99 = 9801
    3 * 1 = 5   : ない 999 * 9 = 8991
    4 * 1 = 4   : （ある）
    3 * 2 = 4   : （ある）
    5 * 1 = 3   : ない
    4 * 2 = 3   : ない
    3 * 3 = 3   : ない 100 * 100
          = 2   : ない
          = 1   : ない 

    """

    pandigital_products_d4_d1 = SeqGenerator.gen_pandigital_products(1, 9, 4, 1)
    print("d4_d1 finished")
    pandigital_products_d3_d2 = SeqGenerator.gen_pandigital_products(1, 9, 3, 2)
    print("d3_d2 finished")
    pandigital_products = pandigital_products_d4_d1 + pandigital_products_d3_d2
    print(pandigital_products)
    pandigital_products = list(set(pandigital_products))

    print(sum(pandigital_products))

