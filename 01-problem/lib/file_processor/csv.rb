require 'csv'

module FileProcessor
  class Csv
    def initialize data, model_class
      @data        = data
      @model_class = model_class
    end

    def call
      data.each_with_object([]) do |line, accum|
        accum << model(split line)
      end
    end

    private 

    def model *args
      flattened_args = args.flatten

      model_class.new_if_valid flattened_args
    end

    def split line
      CSV.parse line
    end

    attr_reader :data, :model_class
  end
end