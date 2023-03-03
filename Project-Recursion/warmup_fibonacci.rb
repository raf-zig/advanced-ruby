def fibs(n)
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

def fibs_rec(n)
  return [0] if n == 0
  return [0, 1] if n == 1
  arr = fibs_rec(n - 1)
  arr << arr[-2] + arr[-1]
end

p fibs (5)
p fibs_rec(5)