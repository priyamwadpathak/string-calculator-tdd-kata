# string_calculator.rb
class StringCalculator
    def add(numbers)
        return 0 if numbers.empty?
        
        normalized = numbers.gsub("\n", ",")
        normalized.split(",").map(&:to_i).sum
    end
end
