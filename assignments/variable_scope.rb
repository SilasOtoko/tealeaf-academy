#1a.
x = 5

def inner_scope(num)
  num = 4
end

p inner_scope(x)

#1b.
x = 5
def non_mutate(num)
  num.to_i + 5
end

non_mutate(6)
p x

#1c.
x = [5, 4]

def mutate(num)
  x = num.pop
end

mutate(x)
p x

#2.
def scope(num)
  num.each do |x|
    x =+ 1
  end
end

array = [1, 2, 3]
array = scope(array)
p array



def change(num)
  num.uniq!
end

array = [1, 2, 2, 3, 4, 5, 5]
array = change(array)
p array
