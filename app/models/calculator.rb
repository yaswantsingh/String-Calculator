class Calculator < ApplicationRecord
    def self.add(str_nums)
        return 0 if str_nums.empty?
        begin
          delimiter = /,|\n/

          if str_nums.start_with?("//")
            parts = str_nums.split("\n", 2)
            custom_delimiter = parts[0][2..]
            delimiter = Regexp.escape(custom_delimiter)
            str_nums = parts[1]
          end

          number_list = str_nums.split(Regexp.union(delimiter)).map(&:to_i)

          negative_nums = number_list.select { |num| num < 0 }
          unless negative_nums.empty?
            raise ArgumentError, "Negative numbers are not allowed: #{negative_nums.join(', ')}"
          end

          number_list.sum
        rescue ArgumentError => e
          raise e
        rescue StandardError
          raise ArgumentError, "Invalid input: Ensure all items are integers and delimiters are correct."
        end
    end
end
