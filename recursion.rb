
# def range(num_1, num_2)
#     return [] if num_1 >= num_2
#     [num_1] + range(num_1 + 1, num_2) 
# end

# p range(1, 5)

# def iter_sum(arr)
#     sum = 0
#     arr.each do |num|
#         sum += num
#     end
#     sum
# end

# p iter_sum([1,2,3,4,5])

# def recursive_sum(arr)
#     return 0 if arr.length == 0
#     arr[0] += recursive_sum(arr[1..-1])
# end

# p recursive_sum([1,2,3,4,5])

# def exp_1(b, n)
#     return 1 if n == 0
#     b * exp_1(b, n - 1)
# end

# p exp_1(5, 3)

# def exp_2(b, n)
#     return 1 if n == 0
#     return b if n == 1

#     if b % 2 == 0
#         value = exp_2(b, n / 2)
#         value * b
#     else
#         value = b * (exp_2(b, (n - 1) / 2))
#         value * b
#     end
# end

# p exp_2(5, 3)

# class Array

#     def deep_dup
#         res = []
#         self.each do |ele|
#             if !ele.kind_of(Array)
#                 res << ele
#             else
#                 res << ele.deep_dup
#             end
#         end
#         res
#     end
# end

# def rec_fibonacci(n)
#     return [] if n == 0
#     return [0] if n == 1
#     return [0, 1] if n == 2

#     array = rec_fibonacci(n - 1)
#     array << array[-1] + array[-2]
# end

# p rec_fibonacci(5)

# def iter_fibonacci(n)
#     return [] if n == 0
#     return [0] if n == 1
#     return [0, 1] if n == 2

#     fib = [0, 1, 1]

#     while fib.length < n
#         first = fib[-1]
#         second = fib[-2]
#         fib << first + second
#     end
#     fib
# end

# p iter_fibonacci(5)

# def bsearch(array, target)
#     return nil if array.empty?
#     return 0 if array[0] == target && array.length == 1

#     # we choose a pivot element, find length of array and divide by two (this will be pivot element)
#     # grab pivot element and compare with target
#     # if pivot element == target, return pivot index
#     # if pivot element > target, target is on left side of pivot element
#     # return recursive call of [0...pivot index]
#     # if pivot element < target, taret is on right side of pivot element
#     # return recursive call of [pivot index + 1 ..-1] + (pivot index + 1)

#     pivot = array.length / 2

#     if array[pivot] == target
#         return pivot
#     end
#     if array[pivot] > target
#         return bsearch(array[0...pivot], target)
#     end
#     if array[pivot] < target
#         value = bsearch(array[pivot + 1..-1], target)
#         value.nil? ? nil : value + pivot + 1
#     end
# end

# p bsearch([1, 2, 3], 1) # => 0
# p bsearch([2, 3, 4, 5], 3) # => 1
# # p bsearch([2, 4, 6, 8, 10], 6) # => 2
# # p bsearch([1, 3, 4, 5, 9], 5) # => 3
# # p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
# # p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
# # p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil

def merge(left_array, right_array)
    sorted_array = []
    while !left_array.empty? && !right_array.empty? do
        if left_array[0] < right_array[0]
            sorted_array.push(left_array.shift)
        else
            sorted_array.push(right_array.shift)
        end
    end 
    return sorted_array.concat(left_array).concat(right_array)
end

# # p merge([1,5],[2,4])

def merge_sort(arr)
    return [] if arr.length == 0
    return arr if arr.length == 1

    # divide the array into the smallest unit (1 ele)
    # compare each ele with the adjacent ele to sort and merge them
    pivot = arr.length / 2
    left = arr[0...pivot]
    right =  arr[pivot..-1]

    sorted_left = merge_sort(left)
    sorted_right = merge_sort(right)

    return merge(sorted_left, sorted_right)
end

# p merge_sort([1,3,7,5])

# def subsets(arr)
#     return [[]] if arr.empty?

#     subs = subsets(arr.take(arr.length - 1))
#     max = subs.map { |sub| sub + [arr[-1]]}
#     subs + max
# end

# p subsets([]) # => [[]]
# p subsets([1]) # => [[], [1]]
# p subsets([1, 2]) # => [[], [1], [2], [1, 2]]
# p subsets([1, 2, 3])
# # => [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]

def permutations(arr)
    return [arr] if arr.length <= 1

    first = arr.shift
    perms = permutations(arr)
    permutated = []

    perms.each do |perm|
        (0..perm.length).each do |i|
            permutated << perm[0...i] + [first] + perm[i..-1]
        end
    end
    permutated
end



p permutations([1,2,3])

