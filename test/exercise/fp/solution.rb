module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(array)
        target_films = array.select { |film| !film['country'].nil? && film['country'].split(',').size > 1 && film['rating_kinopoisk'].to_f.positive? }

        ratings_sum = target_films.map { |film| film['rating_kinopoisk'].to_f }
                                  .reduce(0.0) { |acc, rating| acc + rating }

        ratings_sum / target_films.length
      end

      def chars_count(films, threshold)
        films.select { |film| film['rating_kinopoisk'].to_f >= threshold }
             .map { |film| film['name'] }
             .reduce(0) { |acc, name| acc + name.count('и') }
      end
    end
  end
end
