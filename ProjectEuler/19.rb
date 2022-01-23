#! ruby -Ku
p Time.now.strftime("start %H:%M:%S")

require "date"

START_YEAR = 1901
START_MONTH = 1
START_DAY = 1
END_YEAR = 2000
END_MONTH = 12
END_DAY = 31
SEARCH_WDAY = 0 # 0:日曜日、1:月曜日・・・

start_date = Date.new(START_YEAR,START_MONTH,START_DAY)
end_date = Date.new(END_YEAR,END_MONTH,END_DAY)

now_date = start_date
count = 0
while now_date <= end_date do
	if now_date.wday == SEARCH_WDAY then
		count += 1
	end
	now_date = now_date >> 1
end

p count

p Time.now.strftime("end %H:%M:%S")

