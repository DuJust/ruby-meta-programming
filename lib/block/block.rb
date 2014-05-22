# In common use
array = [1, 2, 3, 4]

array.collect! { |n| n ** 2 } # => [1, 4, 9, 16]

class Array
  def iterate!
    self.each_with_index do |n, i|
      self[i] = yield(n)
    end
  end
end

array.iterate! do |n|
  n ** 2
end

array.inspect # => [1, 4, 9, 16]

# Kernel#block_given?
def block_method
  return yield if block_given?
  'no block'
end

block_method # => 'no block'
block_method { "there's a block" } # => "there's a block"

# Closure
def closure_method
  x = 'Goodbye'
  yield 'cruel'
end

x = 'Hello'
closure_method { |y| "#{x}, #{y} world" } # => "Hello, cruel world"

# Scope
# keywords 'class', 'module', 'def' are Scope-Gates
class MyClass
  v1 = 1
  local_variables   # => ['v1']

  def my_method
    v2 = 2
    local_variables # => ['v2']
  end

  local_variables   # => ['v1']
end

