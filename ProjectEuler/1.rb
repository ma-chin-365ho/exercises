#3��5�̔{���̏ꍇ�����Ă���
sum = 0
for num in 1..999 do
	if num % 3 == 0 || num % 5 == 0 then
		sum += num
		#p num
	end
end

print("answer = ",sum,"\n")

