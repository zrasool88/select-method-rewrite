require 'spec_helper'
require 'array'

describe Array do
  context 'iterative select method' do
    it 'selects numbers based on given condition' do
      arr = [4, 8, 15, 16, 23, 42]
      expect(arr.myselect { |number| number % 2 == 0 }).to eq([4, 8, 16, 42])
    end

    it 'selects strings based on given condition' do
      arr1 = %w(I, Am, Pilgrim)
      expect(arr1.myselect {|word| word.length > 3}).to eq(['Pilgrim'])
    end

    it 'selects an array from within an array based on a given condition' do
      nested_arr = [[4, 8, 15, 16, 23, 42],%w(I, Am, Pilgrim)]
      expect(nested_arr.myselect {|array| array.size > 3}).to eq([[4, 8, 15, 16, 23, 42]])
    end
  end
end
