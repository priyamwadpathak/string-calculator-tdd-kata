# string_calculator_spec.rb  
require 'rspec'
require_relative 'string_calculator'

RSpec.describe StringCalculator do
  describe '#add' do
    it 'returns zero for empty string' do
      calculator = StringCalculator.new
      expect(calculator.add("")).to eq(0)
    end
  end
end
