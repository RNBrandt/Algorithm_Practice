for arr_i in (0..6-1)
    arr_t = gets.strip
    arr[arr_i] = arr_t.split(' ').map(&:to_i)
end

def make_sums(arr, first_level, value)
    first_level_sum = arr[first_level][value] + arr[first_level][value+1]  + arr[first_level][value+2]
    second_level_sum = arr[first_level+1][value+1]
    third_level_sum = arr[first_level+2][value] + arr[first_level+2][value+1]  + arr[first_level+2][value+2]
    total_sum = first_level_sum + second_level_sum + third_level_sum
end
def make_it_work(arrays)
    value =0
    first_level = 0
    highest = []
    while first_level <= 3
        if value <=3
            # do the buisness
            result = make_sums(arrays, first_level, value)
            value += 1
            if !highest.max
                highest << result
            end
            if result > highest.max
                highest << result
            end
        else
            first_level += 1
            value = 0
        end
        test = highest.max
    end
    test
end
p make_it_work(arr)
