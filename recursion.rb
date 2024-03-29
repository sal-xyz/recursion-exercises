###Warmup###
#recursive version
def range(s, e)
    if e < s
        return []
    end

    return [s] + range(s + 1, e)
end

#iterative version
def range2(s,e)
    ans = []
    while s <= e
        ans << s
        s += 1
    end
    return ans
end
###End Warmup###




#Exponentiation#
#version 1
#exponent(base, power) = base * base_to_the_smaller_exponent
def exp1(base, power)
    if power == 0
        return 1
    end
    return base * exp1(base, power - 1)
end

#version 2
#You are halving the, you continue squaring it
def exp2(base, power)
    return 1 if power == 0
    return base if power == 1
    if power % 2 == 0 #even
        return exp2(base, power/2) * exp2(base, power/2)
    else
        return base * exp2(base, (power-1)/2) * exp2(base, (power-1)/2)
    end
end


#Dup
def deep_dup(arr)
    ans = []
    arr.each do |ele|
        if ele.is_a?(Array) != true
            puts "recursive"
            ans << ele
        else
            ans << deep_dup(ele)
        end
    end
    return ans
end

#Fibonacci
#iterative fib(5) == 3
def fibI(n)
    ans = [0, 1]
    if n < 3
        return ans
    end
    (3..n).each do |num|
        ans << ans[num-3] + ans[num-2]
    end
    return ans
end

#recursive
def fibR(n)
    if n <= 2
        return [0, 1][0..n]
    end
    res = fibR(n-1)
    res << (res[res.length-1] + res[res.length-2])
    return res
end

#binary search
def bsearch(array, target)
    if array.length == 1
        if array[0] == target
            return 0
        else
            return nil
        end
    end

    middle = array.length / 2
    if target < array[middle]
        bsearch(array[0...middle], target)
    elsif target > array[middle]
        bsearch(array[middle..-1], target) + middle
    else
        return middle
    end
end

