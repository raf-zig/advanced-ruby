# frozen_string_literal: true

# recursive merge sorting
def merge_sort(arr)
  return arr unless arr.length > 1

  arr_1 = merge_sort(arr.slice(0, arr.length / 2))
  arr_2 = merge_sort(arr.slice(arr.length / 2, arr[-1]))

  merge(arr_1, arr_2)
end

def merge(arr_1, arr_2)
  arr = []
  until arr_1.empty? || arr_2.empty?
    if arr_1.first <= arr_2.first
      arr << arr_1.first
      arr_1.delete(arr_1.first)
    else
      arr << arr_2.first
      arr_2.delete(arr_2.first)
    end
  end
  arr += arr_1.empty? ? arr_2 : arr_1
  arr
end

p merge_sort([3, 90, 6, 4, 7, 1, 6, 5])
