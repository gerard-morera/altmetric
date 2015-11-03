class Manager
  def initialize path, builder_class, parser_class, processor_class, file_handler_class: FileHandler
    @path               = path
    @builder_class      = builder_class
    @parser_class       = parser_class
    @processor_class    = processor_class
    @file_handler_class = file_handler_class
  end

  def call
    file   = open_file path
    parser = parse file

    process(parser)
  end

  private

  def open_file path
    file_handler = file_handler_class.new path
    file_handler.open
  end

  def parse data
    parser_class.new data
  end

  def process parser
    file_processor = processor_class.new parser, builder_class
    file_processor.call
  end

  attr_reader :path, :parser_class, :processor_class, :file_handler_class, :builder_class
end