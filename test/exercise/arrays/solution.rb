module Exercise
  module Arrays
    class << self
      def reduce(array, acc = nil)
        acc, *rest = acc.nil? ? array : [acc, *array]
        rest.length.times { |i| acc = yield(acc, rest[i]) }
        acc
      end

      def replace(array)
        max = reduce(array) { |acc, el| el > acc ? el : acc }
        reduce(array, []) { |acc, el| acc << (el.positive? ? max : el) }
      end

      def search(array, query)
        iter = lambda { |part, shift_index|
          return -1 if part.empty?

          index = part.length / 2
          current = part[index]

          if current == query
            shift_index + index
          elsif current > query
            iter.call(part[0, index], shift_index)
          else
            new_part = part[index.next, part.length - index.next]
            new_shift_index = shift_index + index.next
            iter.call(new_part, new_shift_index)
          end
        }
        iter.call(array, 0)
      end
    end
  end
end
