FIBO_MAX_VAL = 4_000_000 #フィボナッチ数列の最大の値
FIBO_TERM1 = 1 #1項目
FIBO_TERM2 = 2 #2項目

#フィボナッチ数列の作成
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

#フィボナッチ数列から偶数の項を抽出
fiboevnary = fiboary.select{|x| x % 2 == 0}

p fiboevnary

#合計
p fiboevnary.inject(:+)

