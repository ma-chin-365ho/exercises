#! ruby -Ku
p Time.now.strftime("start %H:%M:%S")

ADJACENT_NUMBER_LEN = 4
IN_FILE_NAME = "append/11_20x20_grid.txt"

# 格子データを2次元配列に格納
grid_ary = Array.new
File.foreach(IN_FILE_NAME, :encoding => Encoding::UTF_8) do |f_line|
	grid_ary.push (f_line.chomp).split
end

# 縦のマス数、横のマス数を取得
grid_len_v = grid_ary.length
grid_len_h = grid_ary[0].length

# 最大の積を探す(最大の積が見つかった場合上書きしていく)
max_product = 1

#上下に隣接したデータの積
grid_len_h.times do |x|
	(grid_len_v - ADJACENT_NUMBER_LEN + 1).times do |y|
		product = 1
		ADJACENT_NUMBER_LEN.times do |subset|
			product *= grid_ary[y + subset][x].to_i
		end
		if max_product < product then
			max_product = product
		end
	end
end

#左右に隣接したデータの積
grid_len_v.times do |y|
	(grid_len_h - ADJACENT_NUMBER_LEN + 1).times do |x|
		product = 1
		ADJACENT_NUMBER_LEN.times do |subset|
			product *= grid_ary[y][x + subset].to_i
		end
		if max_product < product then
			max_product = product
		end
	end
end

#斜め(右下)に隣接したデータの積
(grid_len_v - ADJACENT_NUMBER_LEN + 1).times do |y|
	(grid_len_h - ADJACENT_NUMBER_LEN + 1).times do |x|
		product = 1
		ADJACENT_NUMBER_LEN.times do |subset|
			product *= grid_ary[y + subset][x + subset].to_i
		end
		if max_product < product then
			max_product = product
		end
	end
end

#斜め(左下)に隣接したデータの積
(grid_len_v - ADJACENT_NUMBER_LEN + 1).times do |y|
	(grid_len_h - ADJACENT_NUMBER_LEN + 1).times do |x|
		product = 1
		ADJACENT_NUMBER_LEN.times do |subset|
			product *= grid_ary[y + subset][x - subset + ADJACENT_NUMBER_LEN - 1].to_i
		end
		if max_product < product then
			max_product = product
		end
	end
end

print("最大の積:",max_product,"\n")

p Time.now.strftime("end %H:%M:%S")

