class Array
  def myselect
    new_array = []
    if block_given?
      each { |element| new_array << element if yield(element) == true }
      new_array
    else
      to_enum(:myselect)
    end
  end

  def myselect_recursive(new_array = [], &block)
    copy_of_array = dup
    if !block_given?
      to_enum(:myselect_recursive)
    else
      run_it_recursively(copy_of_array, new_array, &block)
    end
  end

  private

  def run_it_recursively(copy_of_array, new_array, &block)
    return new_array if copy_of_array.empty?
    new_array << copy_of_array[0] if yield(copy_of_array[0]) == true
    copy_of_array.drop(1).myselect_recursive(new_array, &block)
  end
end
