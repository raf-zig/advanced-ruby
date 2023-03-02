def fibs (n)
  arr = [0]
  if n == 1
     arr << 1
  elsif n > 1
    arr[0],arr[1] = 0, 1
    index = 2
    (n - 2).times do
      arr[index] = arr[index - 1] + arr[index - 2]
      index += 1
    end
  end
  arr
end
