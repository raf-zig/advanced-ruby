require_relative 'linked_list'

linked_list = LinkedList.new(8)

linked_list.append(9)
linked_list.append(12)
linked_list.prepend(7)
linked_list.prepend(6)

#p linked_list.size
#p linked_list.head
#p linked_list.tail
#p linked_list.at(2)
#p linked_list.at(0)
#p linked_list.at(10)
#linked_list.pop
#p linked_list.contains?(45)
#p linked_list.contains?(7)
#p linked_list.find(9)
#p linked_list.find(45)
#linked_list.insert_at(11, 9)
#linked_list.insert_at(11, 4)
linked_list.to_s