require 'csv'

module Presenters
  class Csv
    def initialize collection
      @collection = collection
    end

    def call
      collection.each do |line|
        puts line.join(',')
      end
    end

    private

    attr_reader :collection
  end
end