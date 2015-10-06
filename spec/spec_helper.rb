# coding: utf-8

require 'bundler/setup'

require 'simplecov'
SimpleCov.start do
  minimum_coverage 95
end

require 'active_support/core_ext/hash/deep_merge'
require 'paperdist'
require 'rspec'

RSpec.configure do |config|
  config.before(:each) do
    allow(Rails).to receive(:env).and_return(defined?(env) ? env : :development)
    Paperdist.config = Paperdist::Configuration.new(File.join(File.dirname(__FILE__), '/fixtures/paperdist.yml').to_s)
  end
end
