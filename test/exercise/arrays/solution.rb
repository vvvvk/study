module Exercise
  module Arrays
    class << self
      def replace(array)
        max = array.reduce { |acc, el| el > acc ? el : acc }
        array.map { |el| el.positive? ? max : el }
      end

      def search(array, query)
        iter = lambda { |shift_index, len|
          return -1 if len.zero?

          index = len / 2
          current = array[shift_index + index]

          if current == query
            shift_index + index
          elsif current > query
            iter.call(shift_index, index)
          else
            new_len = len - index.next
            new_shift_index = shift_index + index.next
            iter.call(new_shift_index, new_len)
          end
        }
        iter.call(0, array.length)
      end
    end
  end
end
