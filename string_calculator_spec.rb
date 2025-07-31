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
  end
end
