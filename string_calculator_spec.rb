# string_calculator_spec.rb  
require 'rspec'
require_relative 'string_calculator'

RSpec.describe StringCalculator do
  let(:calculator) { StringCalculator.new }

  describe '#add' do
    it 'returns zero for empty string' do
        expect(calculator.add("")).to eq(0)
    end

    it 'returns the number itself for single number' do
        expect(calculator.add("1")).to eq(1)
    end

    it 'returns sum of two numbers' do
        expect(calculator.add("1,5")).to eq(6)
        expect(calculator.add("2,3")).to eq(5)
        expect(calculator.add("10,15")).to eq(25)
    end

    it 'returns sum of three or more numbers' do
        expect(calculator.add("1,2,3")).to eq(6)
        expect(calculator.add("1,2,3,4,5")).to eq(15)
    end

    it 'handles newlines between numbers' do
        expect(calculator.add("1\n2,3")).to eq(6)
    end

    it 'handles semicolon delimiter' do
        expect(calculator.add("//;\n1;2")).to eq(3)
    end

    it 'handles pipe and asterisk delimiter' do
        expect(calculator.add("//|\n1|2|3")).to eq(6)
        expect(calculator.add("//*\n1*2*3")).to eq(6)
    end

    it 'raises exception for single negative number' do
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
        expect { calculator.add("//;\n1;-2;3;-4") }.to raise_error(
            ArgumentError,
            "negative numbers not allowed -2,-4"
        )
    end

    it 'handles zero values and large numbers' do
        expect(calculator.add("0")).to eq(0)
        expect(calculator.add("0,5")).to eq(5)
        expect(calculator.add("1,0,2")).to eq(3)
        expect(calculator.add("1000,2000")).to eq(3000)
    end
  end
end
