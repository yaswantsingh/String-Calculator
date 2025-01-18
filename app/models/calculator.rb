class Calculator < ApplicationRecord
    def self.add(str_nums)
        return 0 if str_nums.empty?

        begin
          number_list = str_nums.split(',').map(&:to_i)
          number_list.sum
        rescue ArgumentError
          raise ArgumentError, "Invalid input: Ensure all items are separated by commas."
        end
    end
end
