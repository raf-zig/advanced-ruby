require_relative 'linked_list'

linked_list = LinkedList.new(8)

linked_list.append(9)
linked_list.append(12)
linked_list.prepend(7)
linked_list.prepend(6)

#p linked_list.size
#p linked_list.head
#p linked_list.tail
p linked_list.at(2)
p linked_list.at(0)
p linked_list.at(10)