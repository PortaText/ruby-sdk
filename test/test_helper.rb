$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'coveralls'
require 'simplecov'
require 'codeclimate-test-reporter'
CodeClimate::TestReporter.start
SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new [
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
SimpleCov.start do
  add_filter '/test/'
end

require 'portatext'
require 'minitest/autorun'
require_relative 'helper/command_tester'
