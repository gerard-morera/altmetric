require_relative 'lib/file_handler.rb'
require_relative 'lib/input_handler.rb'
require_relative 'lib/parsers/csv.rb'
require_relative 'lib/parsers/json.rb'
require_relative 'lib/file_processor/csv.rb'
require_relative 'lib/file_processor/json.rb'
require_relative 'lib/resources/articles.rb'
require_relative 'lib/resources/authors.rb'
require_relative 'lib/resources/journals.rb'
require_relative 'lib/matcher.rb'

class Combine
  def call
    case input_handler.format
    when "json"
      json_format
    when "css"
      css_format
    else
      raise "wrong format"
    end
  end

  def css_format
    operations
  end

  def json_format
    operations
  end

  def operations
    journals_path = input_handler.journals
    authors_path  = input_handler.authors
    articles_path = input_handler.articles

    journals_file = file journals_path
    authors_file  = file authors_path
    articles_file = file articles_path

    articles_parser = csv_parser articles_file
    journals_parser = csv_parser journals_file
    authors_parser  = json_parser authors_file

    articles = csv_file_processor(articles_parser, Resources::Articles)
    journals = csv_file_processor(journals_parser, Resources::Journals)
    authors  = json_file_processor(authors_parser, Resources::Authors)

    matcher articles, journals, authors
  end
 
  def csv_file_processor parser, resource
    file_processor = FileProcessor::Csv.new(parser, resource)
    file_processor.call
  end

  def json_file_processor parser, resource
    file_processor = FileProcessor::Json.new(parser, resource)
    file_processor.call
  end

  def csv_parser file
    Parsers::Csv.new file
  end

  def json_parser file
    Parsers::Json.new file
  end

  def input_handler
    @input_handler ||= InputHandler.new
  end

  def file path
    filehandler = FileHandler.new(path)
    filehandler.open
  end

  def matcher articles, journals, authors
    matcher = Matcher.new(articles, journals, authors)
    matcher.call
  end
end

combine = Combine.new
combine.call


