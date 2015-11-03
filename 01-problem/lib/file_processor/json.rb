module FileProcessor
  class Json
    def initialize data, builder_class
      @data          = data
      @builder_class = builder_class
    end

    def call
      data.each_with_object([]) do |object, accum|
        accum << model_builder(object)
      end
    end

    private

    def model_builder data
      builder = builder_class.new data
      builder.call
    end

    attr_reader :data, :builder_class
  end
end