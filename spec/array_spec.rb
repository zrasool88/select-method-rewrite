require 'spec_helper'
require 'array'

describe Array do
  context 'iterative select method' do
    it 'selects numbers based on given condition' do
      arr = [4, 8, 15, 16, 23, 42]
      expect(arr.myselect(&:even?)).to eq([4, 8, 16, 42])
    end

    it 'selects strings based on given condition' do
      arr1 = %w(I Am Pilgrim)
      expect(arr1.myselect { |word| word.length > 3 }).to eq(['Pilgrim'])
    end

    it 'selects an array from within an array based on a given condition' do
      nested_arr = [[4, 8, 15, 16, 23, 42], %w(I Am Pilgrim)]
      expect(nested_arr.myselect do |array|
        array.size > 3
      end).to eq([[4, 8, 15, 16, 23, 42]])
    end

    it 'returns enumerator if no block is given' do
      arr = [4, 8, 15, 16, 23, 42]
      expect(arr.myselect).to be_an_instance_of(Enumerator)
    end
  end

  context 'recursive select method' do
    it 'selects numbers based on given condition' do
      arr = [4, 8, 15, 16, 23, 42]
      expect(arr.myselect(&:even?)).to eq([4, 8, 16, 42])
    end

    it 'selects strings based on given condition' do
      arr1 = %w(I Am Pilgrim)
      expect(arr1.myselect_recursive { |word| word.length == 2 }).to eq(['Am'])
    end

    it 'selects an array from within an array based on a given condition' do
      nested_arr = [[4, 8, 15, 16, 23, 42], %w(I Am Pilgrim)]
      expect(nested_arr.myselect_recursive do |array|
        array.size == 3
      end).to eq([%w(I Am Pilgrim)])
    end
  end
end
