# string_calculator.rb
class StringCalculator
    def add(numbers)
        return 0 if numbers.empty?
        
        if numbers.start_with?("//")
            delimiter_line, numbers_part = numbers.split("\n", 2)
            delimiter = delimiter_line[2..-1]
            normalized = numbers_part.gsub("\n", delimiter)
            normalized.split(delimiter).map(&:to_i).sum
        else
            normalized = numbers.gsub("\n", ",")
            normalized.split(",").map(&:to_i).sum
        end
    end
end
