class Manager
  def initialize path, model, parser_class, processor_class, file_handler_class: FileHandler
    @path               = path
    @model              = model
    @parser_class       = parser_class
    @processor_class    = processor_class
    @file_handler_class = file_handler_class
  end

  def call
    file   = open_file path
    parser = parse file

    process(parser, model)
  end

  private

  def open_file path
    file_handler = file_handler_class.new path
    file_handler.open
  end

  def parse data
    parser_class.new data
  end

  def process parser, model
    file_processor = processor_class.new parser, model
    file_processor.call
  end

  attr_reader :path, :parser_class, :processor_class, :file_handler_class, :model
end