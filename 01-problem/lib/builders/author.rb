require_relative '../validators/author.rb'
require_relative '../models/author.rb'

module Builders
  class Author
    def initialize data
      @data = data
    end

    def call
      Models::Author.new(data) if valid?
    end

    private

    def valid?
      validator = Validators::Author.new data
      validator.call
    end

    attr_reader :data
  end
end