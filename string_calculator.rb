# string_calculator.rb
class StringCalculator
    NEGATIVE_NUMBERS_ERROR = "negative numbers not allowed"
    DEFAULT_DELIMITER = ","
    CUSTOM_DELIMITER_PREFIX = "//"
    
    def add(numbers)
        return 0 if empty_input?(numbers)
        
        delimiter, numbers_string = parse_input(numbers)
        number_list = extract_numbers(numbers_string, delimiter)
        
        validate_no_negatives(number_list)
        
        number_list.sum
    end
    
    private
    
    def empty_input?(input)
        input.nil? || input.empty?
    end
    
    def parse_input(input)
        if custom_delimiter?(input)
            extract_custom_delimiter(input)
        else
            [DEFAULT_DELIMITER, input]
        end
    end
    
    def custom_delimiter?(input)
        input.start_with?(CUSTOM_DELIMITER_PREFIX)
    end
    
    def extract_custom_delimiter(input)
        delimiter_line, numbers_part = input.split("\n", 2)
        delimiter = delimiter_line[2..-1]
        [delimiter, numbers_part]
    end
    
    def extract_numbers(numbers_string, delimiter)
        normalized_string = normalize_delimiters(numbers_string, delimiter)
        convert_to_integers(normalized_string, delimiter)
    end
    
    def normalize_delimiters(string, delimiter)
        string.gsub("\n", delimiter)
    end
    
    def convert_to_integers(string, delimiter)
        string.split(delimiter).map(&:to_i)
    end
    
    def validate_no_negatives(numbers)
        negative_numbers = numbers.select(&:negative?)
        
        return if negative_numbers.empty?
        
        raise ArgumentError, build_negative_error_message(negative_numbers)
    end
    
    def build_negative_error_message(negative_numbers)
        "#{NEGATIVE_NUMBERS_ERROR} #{negative_numbers.join(',')}"
    end
end
