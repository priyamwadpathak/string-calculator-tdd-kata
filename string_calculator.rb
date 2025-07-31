# string_calculator.rb
class StringCalculator
    def add(numbers)
        return 0 if numbers.empty?
        
        delimiter, numbers_string = parse_delimiter(numbers)
        normalized = numbers_string.gsub("\n", delimiter)
        normalized.split(delimiter).map(&:to_i).sum
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
