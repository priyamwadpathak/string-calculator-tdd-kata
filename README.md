## String Calculator TDD Kata

A Ruby implementation of the classic String Calculator TDD Kata, showcasing Test-Driven Development principles and clean code practices.

## Overview

This project demonstrates a methodical TDD approach to building a string calculator that can:

- Handle empty strings
- Sum comma-separated numbers
- Support newline delimiters
- Accept custom delimiters
- Validate against negative numbers

## Prerequisites

Ruby 3.0+

## Project Setup

cd string-calculator-tdd-kata
bundle install
bundle exec rspec --init

### Run all tests

bundle exec rspec string_calculator_spec.rb

### Detailed output with colors

bundle exec rspec string_calculator_spec.rb --format documentation --color
