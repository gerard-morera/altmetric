require_relative 'lib/file_handler.rb'
require_relative 'lib/path_identifier.rb'
require_relative 'lib/line_parser.rb'
require_relative 'lib/processor/csv.rb'
require_relative 'lib/articles.rb'

class Combine

  def call
    path = PathIdentifier.new.articles
    file = FileHandler.new(path).open

    line_parser = LineParser.new file
   
    a =Processor::Csv.new(line_parser, Articles).call
    binding.pry
  end
end

combine = Combine.new
combine.call
