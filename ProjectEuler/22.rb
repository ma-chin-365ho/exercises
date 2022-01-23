#! ruby -Ku
p Time.now.strftime("start %H:%M:%S")
require "csv"

IN_FILE_PATH = "append/22_names.txt"

name_ary = CSV.read(IN_FILE_PATH)
# IN_FILE_PATHは中身が1行のみなので、1次元配列で上書き
name_ary = name_ary[0]

# アルファベットのスコア用ハッシュ作成
alphabet_score_hash = Hash.new
i = 1
for c in "A".."Z" do
	alphabet_score_hash[c] = i
	i += 1
end
p alphabet_score_hash

# アルファベット順にソートして、スコアを計算
score_total = 0
i = 1
name_ary.sort.each do |s|
	score = 0
	s.split(//).each do |c|
		score += alphabet_score_hash[c]
	end
	score_total += score * i
	i += 1
end

p score_total

p Time.now.strftime("end %H:%M:%S")

