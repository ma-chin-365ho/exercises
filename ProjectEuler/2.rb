FIBO_MAX_VAL = 4_000_000 #�t�B�{�i�b�`����̍ő�̒l
FIBO_TERM1 = 1 #1����
FIBO_TERM2 = 2 #2����

#�t�B�{�i�b�`����̍쐬
fiboary = Array.new
fiboary.push FIBO_TERM1
fiboary.push FIBO_TERM2

newnum = 0
i = 2
while newnum <= FIBO_MAX_VAL do 
	newnum = fiboary[i-1] + fiboary[i-2]
	fiboary.push newnum
	i += 1
end
fiboary.delete_at i - 1

p fiboary

#�t�B�{�i�b�`���񂩂�����̍��𒊏o
fiboevnary = fiboary.select{|x| x % 2 == 0}

p fiboevnary

#���v
p fiboevnary.inject(:+)

