#! ruby -Ku
def log(s)
	p Time.now.strftime("%H:%M:%S | " + s)
end

log "start"

A_MIN = 2
A_MAX = 100
B_MIN = 2
B_MAX = 100
#A_MIN = 2
#A_MAX = 5
#B_MIN = 2
#B_MAX = 5

ary = Array.new()
(A_MAX - A_MIN + 1).times do |i|
	a = i + A_MIN
	(B_MAX - B_MIN + 1).times do |j|
		b = j + B_MIN
		ary.push a ** b
	end
end

# p ary.uniq.sort
p ary.uniq.length



ary.push 

log "end"

