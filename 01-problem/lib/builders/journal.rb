require_relative '../validators/journal.rb'
require_relative '../models/journal.rb'

module Builders
  class Journal
    def initialize data
      @data = data
    end

    def call
      Models::Journal.new(data) if valid?
    end

    private

    def valid?
      validator = Validators::Journal.new data
      validator.call
    end

    attr_reader :data
  end
end