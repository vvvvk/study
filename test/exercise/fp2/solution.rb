module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each
        length.times { |i| yield(self[i]) }
        self
      end

      # Написать свою функцию my_map
      def my_map
        my_reduce(MyArray.new) { |acc, el| acc << yield(el) }
      end

      # Написать свою функцию my_compact
      def my_compact
        my_reduce(MyArray.new) { |acc, el| el.nil? ? acc : acc << el }
      end

      # Написать свою функцию my_reduce
      def my_reduce(acc = nil)
        acc, *rest = acc.nil? ? self : [acc, *self]
        rest.length.times { |i| acc = yield(acc, rest[i]) }
        acc
      end
    end
  end
end
