module Enumerable
  def my_each 
    for element in self
      yield element
    end
  end

  def my_each_with_index
    i = 0
    for element in self
      yield element, i
      i += 1 
    end
  end

  def my_select
    arr = []
    for element in self
      arr << element if yield element
    end
    arr
  end

  def my_all?
    x = true
    for element in self
      x = false unless yield element
    end
    x
  end

  def my_any?
    x = false
    for element in self
      x = true if yield element
    end
    x
  end

  def my_none?
    x = 0
    for element in self
      x = false if yield element
    end
    x
  end

  def my_count
    x = []
    for element in self
      x << element if yield element
    end
    x.size
  end

  def my_map
    x = []
    for element in self
      y = yield element
      x << y
    end
    x
  end

  def my_inject (value = 0)
     new_value = value
    for element in self
      new_value = yield(new_value, element)
    end
    new_value
  end
end

n = [4, 4, 6]

puts ' my_each'
n.my_each { |v| print v }
puts
n.each { |v| print v }
puts 

puts ' my_each_with_index'
n.my_each_with_index { |v, i| print "item - #{v},index - #{i}  " }
puts
n.each_with_index { |v, i| print "item - #{v},index - #{i}  " }
puts

puts ' my_select'
p n.my_select { |v| v > 5 }
p n.select { |v| v > 5 } 

puts ' my_all?'
p n.my_all? { |v| v / 2 == 2 }
p n.all? { |v| v / 2 == 2 }

puts ' my_any?'
p n.my_any? { |v| v / 2 == 2 }
p n.any? { |v| v / 2 == 2 }

puts ' my_none?'
p n.my_none? { |v| v / 2 == 2 }
p n.none? { |v| v / 2 == 2 }

puts ' my_count'
p n.my_count { |v| v / 2 == 2 }
p n.count { |v| v / 2 == 2 }

puts ' my_map'
p n.my_map { |v| v / 2 }
p n.map { |v| v / 2  }

puts ' my_inject'
p n.my_inject { |sum, v| sum + v }
p n.inject { |sum, v| sum + v } 