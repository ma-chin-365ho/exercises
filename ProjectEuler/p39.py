from common.algebra.seq_generator import SeqGenerator

def main():
    max_number = 1000
    max_cnt_solutions = 0
    max_cnt_solutions_num = 0
    for num in range(1, max_number):
        right_angle_triangles = SeqGenerator.gen_right_angle_triangles(num)
        len_right_angle_triangles = len(right_angle_triangles)
        if len_right_angle_triangles > 0:
            print("perimeter = " + str(num))
            print(right_angle_triangles)
        if len_right_angle_triangles > max_cnt_solutions:
            max_cnt_solutions_num = num
            max_cnt_solutions = len_right_angle_triangles

    print("solution : " + str(max_cnt_solutions))
    print("perimeter : " + str(max_cnt_solutions_num))