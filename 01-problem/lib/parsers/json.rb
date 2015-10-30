require 'json'

module Parsers
  class Json
    include Enumerable

    def initialize file
      @file = file
    end

    def each
      complete_file_to_json.each do |object|
        yield object
      end
    end

    private

    def complete_file_to_json
      JSON.parse(complete_file.first)
    end

    def complete_file
      File.readlines(file)
    end

    attr_reader :file
  end
end