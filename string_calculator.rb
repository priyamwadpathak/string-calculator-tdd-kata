# string_calculator.rb
class StringCalculator
    def add(numbers)
        return 0 if numbers.empty?
        
        delimiter, numbers_string = parse_delimiter(numbers)
        normalized = numbers_string.gsub("\n", delimiter)
        normalized.split(delimiter).map(&:to_i).sum
        number_list = normalized.split(delimiter).map(&:to_i)
        
        negatives = number_list.select { |n| n < 0 }
        unless negatives.empty?
        raise ArgumentError, "negative numbers not allowed #{negatives.join(',')}"
        end
        
        number_list.sum
    end
  
    private
  
    def parse_delimiter(input)
        if input.start_with?("//")
            delimiter_line, numbers_part = input.split("\n", 2)
            delimiter = delimiter_line[2..-1]
            [delimiter, numbers_part]
        else
            [",", input]
        end
    end
end
