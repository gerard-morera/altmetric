require 'csv'

module FileProcessor
  class Csv
    def initialize data, builder_class
      @data          = data
      @builder_class = builder_class
    end

    def call
      data.each_with_object([]) do |line, accum|
        accum << model_builder(parse line)
      end
    end

    private 

    def model_builder data
      builder = builder_class.new data.flatten
      builder.call
    end

    def parse line
      CSV.parse line
    end

    attr_reader :data, :builder_class
  end
end