require 'pry'

module FileProcessor
  class Json
    def initialize data, resource_class
      @data           = data
      @resource_class = resource_class
    end

    def call
      data.each_with_object([]) do |object, accum|
        accum << resource(object)
      end
    end

    private

    def resource object
      resource_class.new_if_valid object
    end

    attr_reader :data, :resource_class
  end
end