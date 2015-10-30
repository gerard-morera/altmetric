require_relative 'lib/file_handler.rb'
require_relative 'lib/path_identifier.rb'
require_relative 'lib/parsers/csv.rb'
require_relative 'lib/parsers/json.rb'
require_relative 'lib/file_processor/csv.rb'
require_relative 'lib/file_processor/json.rb'
require_relative 'lib/resources/articles.rb'

class Combine

  def call_csv
    path = PathIdentifier.new.articles
    file = FileHandler.new(path).open

    csv_parser = Parsers::Csv.new file
   
    a =FileProcessor::Csv.new(csv_parser, Resources::Articles).call
    binding.pry
  end

  def call_json
    path = PathIdentifier.new.authors
    file = FileHandler.new(path).open

    json_parser = Parsers::Json.new(file)
    fp = FileProcessor::Json.new(json_parser, Resources::Articles).call


  end
end

combine = Combine.new
combine.call_json


