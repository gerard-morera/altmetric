require_relative 'lib/file_handler.rb'
require_relative 'lib/input_handler.rb'
require_relative 'lib/parsers/csv.rb'
require_relative 'lib/parsers/json.rb'
require_relative 'lib/file_processor/csv.rb'
require_relative 'lib/file_processor/json.rb'
require_relative 'lib/resources/articles.rb'
require_relative 'lib/resources/authors.rb'

class Combine

  def call_csv
    path = InputHandler.new.articles
    file = FileHandler.new(path).open

    csv_parser = Parsers::Csv.new file
   
    a =FileProcessor::Csv.new(csv_parser, Resources::Articles).call
    binding.pry
  end

  def call_json
    path = InputHandler.new.journals
    file = FileHandler.new(path).open

    json_parser = Parsers::Json.new(file)
    fp = FileProcessor::Json.new(json_parser, Resources::Authors).call
  end

  def path_identifier
    InputHandler.new
  end

  def file path
    filehandler = FileHandler.new(path)
    filehandler.open
  end
end

combine = Combine.new
combine.call_json


