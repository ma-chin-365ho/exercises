#!/bin/ruby

require 'json'
require 'stringio'

# Complete the sockMerchant function below.
def sockMerchant(n, ar)

    match_cnt = 0

    arr = Array.new
    
    arr.push ar[0]
    for idx in 1..(n-1) do
    
        flg = false
        match_idx = 0
        arr.each do |val|
            if ar[idx] == val then
                flg = true
                break
            end
            match_idx = match_idx + 1
        end
        
        if flg == true then
            match_cnt = match_cnt + 1
            arr.delete_at(match_idx)
        else
            arr.push ar[idx]
        end
    end
    
    return match_cnt
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

n = gets.to_i

ar = gets.rstrip.split(' ').map(&:to_i)

result = sockMerchant n, ar

fptr.write result
fptr.write "\n"

fptr.close()
