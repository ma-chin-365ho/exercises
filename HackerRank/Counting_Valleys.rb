#!/bin/ruby

require 'json'
require 'stringio'

# Complete the countingValleys function below.
def countingValleys(n, s)

    takasa = 0
    takasa_old = 0
    valley_cnt = 0
    
    for idx in  0..(n - 1) do
        
        if s[idx] == "U" then
            takasa = takasa + 1
        else
            takasa = takasa - 1
        end
        
        p takasa
        p takasa_old
        if takasa == 0 and takasa_old < 0 then
            valley_cnt = valley_cnt + 1
        end
        takasa_old = takasa
    end

    return valley_cnt

end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

n = gets.to_i

s = gets.to_s.rstrip

result = countingValleys n, s

fptr.write result
fptr.write "\n"

fptr.close()
