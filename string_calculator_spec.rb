# string_calculator_spec.rb  
require 'rspec'
require_relative 'string_calculator'

RSpec.describe StringCalculator do
  describe '#add' do
    it 'returns zero for empty string' do
        calculator = StringCalculator.new
        expect(calculator.add("")).to eq(0)
    end

    it 'returns the number itself for single number' do
        calculator = StringCalculator.new
        expect(calculator.add("1")).to eq(1)
    end

    it 'returns sum of two numbers' do
        calculator = StringCalculator.new
        expect(calculator.add("1,5")).to eq(6)
        expect(calculator.add("2,3")).to eq(5)
        expect(calculator.add("10,15")).to eq(25)
    end

    it 'returns sum of three or more numbers' do
        calculator = StringCalculator.new
        expect(calculator.add("1,2,3")).to eq(6)
        expect(calculator.add("1,2,3,4,5")).to eq(15)
    end

    it 'handles newlines between numbers' do
        calculator = StringCalculator.new
        expect(calculator.add("1\n2,3")).to eq(6)
    end

    it 'handles semicolon delimiter' do
        calculator = StringCalculator.new
        expect(calculator.add("//;\n1;2")).to eq(3)
    end

    it 'handles pipe and asterisk delimiter' do
        calculator = StringCalculator.new
        expect(calculator.add("//|\n1|2|3")).to eq(6)
        expect(calculator.add("//*\n1*2*3")).to eq(6)
    end

    it 'raises exception for single negative number' do
        calculator = StringCalculator.new
        expect { calculator.add("-1") }.to raise_error(
            ArgumentError, 
            "negative numbers not allowed -1"
        )
        expect { calculator.add("1,-2,3,-4") }.to raise_error(
            ArgumentError,
            "negative numbers not allowed -2,-4"
        )
    end

    it 'handles negatives with custom delimiters' do
        calculator = StringCalculator.new
        expect { calculator.add("//;\n1;-2;3;-4") }.to raise_error(
            ArgumentError,
            "negative numbers not allowed -2,-4"
        )
    end
  end
end
