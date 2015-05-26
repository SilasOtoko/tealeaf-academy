def no_mutate(arr)
  arr.uniq
end

def mutate(arr)
  arr.uniq!
end

array = [1,2,3,3]
no_mutate(array)
p array
mutate(array)
p array