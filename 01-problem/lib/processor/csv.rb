module Processor
  class Csv
    def initialize data, resource_class
      @data           = data
      @resource_class = resource_class
    end

    def call
      data.each_with_object([]) do |line, accum|
        accum << resource(split(line))
      end
    end

    private

    def resource *args
      flattened_args = args.flatten

      resource_class.new flattened_args
    end

    def split line
      line.split(',')
    end

    attr_reader :data, :resource_class
  end
end