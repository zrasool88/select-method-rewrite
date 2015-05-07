class Array
  def myselect
    new_array = []
    each { |element| new_array << element if yield(element) == true }
    new_array
  end
end
