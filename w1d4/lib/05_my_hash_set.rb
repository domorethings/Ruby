# MyHashSet
#
# Ruby provides a class named `Set`. A set is an unordered collection of
# values with no duplicates.  You can read all about it in the documentation:
#
# http://www.ruby-doc.org/stdlib-2.1.2/libdoc/set/rdoc/Set.html
#
# Let's write a class named `MyHashSet` that will implement some of the
# functionality of a set. Our `MyHashSet` class will utilize a Ruby hash to keep
# track of which elements are in the set.  Feel free to use any of the Ruby
# `Hash` methods within your `MyHashSet` methods.
#
# Write a `MyHashSet#initialize` method which sets an empty hash object to
# `@store`. Next, write an `#insert(el)` method that stores `el` as a key
# in `@store`, storing `true` as the value. Write an `#include?(el)`
# method that sees if `el` has previously been `insert`ed by checking the
# `@store`; return `true` or `false`.
#
# Next, write a `#delete(el)` method to remove an item from the set.
# Return `true` if the item had been in the set, else return `false`.  Add
# a method `#to_a` which returns an array of the items in the set.
#
# Next, write a method `set1#union(set2)` which returns a new set which
# includes all the elements in `set1` or `set2` (or both). Write a
# `set1#intersect(set2)` method that returns a new set which includes only
# those elements that are in both `set1` and `set2`.
#
# Write a `set1#minus(set2)` method which returns a new set which includes
# all the items of `set1` that aren't in `set2`.

# use ruby hash to keep track of the set
class MyHashSet
  # hash#initialize - sets an empty hash object to @store
  def initialize
    @store = {}
  end
  # #insert(el) - stores "el" as a key in @store
  # store true as the value if it exists
  def insert(el)
    @store[el] = true
  end
  # #delete(el) - remove an "el" from a set  
  # true / false if the item has been in the set
  def delete(el)
    # false if the item not in set
    return false unless self.include?(el)
    # delete item from the set
    @store.delete(el) # why do we not use @store?
    true
  end
  # #include?
  def include?(value)
    @store.has_key?(value)
  end
  # to_a - returns an array of the items in the set
  def to_a
    @store.keys
  end
  # set1#union(set2) - returns a new set which includes only elements
  # in set1, or set2
  def union(set2)
    union_set = self.class.new
    self.to_a.each { |el| union_set.insert(el) }
    set2.to_a.each { |el| union_set.insert(el) }
    union_set
  end

  def intersect(set2)
    intersect_set = self.class.new 
    self.to_a.each do |el|
      intersect_set.insert(el) if set2.include?(el)
    end

    intersect_set
  end

  # #minus - returns all of the elements that are in set1
  # but are not in set2
  def minus(set2)
    # create a new set
    new_set = self.class.new
    # iterate through minus_set, remove elements in set2
    # if the el is included in set2, turn the element to false
    self.to_a.each do |el|
      new_set.insert(el) unless set2.include?(el)
    end

    new_set
  end
end

# Bonus
#
# - Write a `set1#symmetric_difference(set2)` method; it should return the
#   elements contained in either `set1` or `set2`, but not both!
# - Write a `set1#==(object)` method. It should return true if `object` is
#   a `MyHashSet`, has the same size as `set1`, and every member of
#   `object` is a member of `set1`.
