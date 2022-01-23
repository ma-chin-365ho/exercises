#! ruby -Ku
p Time.now.strftime("start %H:%M:%S")
require "csv"

IN_FILE_PATH = "append/22_names.txt"

name_ary = CSV.read(IN_FILE_PATH)
# IN_FILE_PATH�͒��g��1�s�݂̂Ȃ̂ŁA1�����z��ŏ㏑��
name_ary = name_ary[0]

# �A���t�@�x�b�g�̃X�R�A�p�n�b�V���쐬
alphabet_score_hash = Hash.new
i = 1
for c in "A".."Z" do
	alphabet_score_hash[c] = i
	i += 1
end
p alphabet_score_hash

# �A���t�@�x�b�g���Ƀ\�[�g���āA�X�R�A���v�Z
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

