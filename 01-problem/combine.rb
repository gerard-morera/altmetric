require_relative 'lib/file_handler.rb'
require_relative 'lib/input_handler.rb'
require_relative 'lib/parsers/csv.rb'
require_relative 'lib/parsers/json.rb'
require_relative 'lib/file_processor/csv.rb'
require_relative 'lib/file_processor/json.rb'
require_relative 'lib/models/articles.rb'
require_relative 'lib/models/authors.rb'
require_relative 'lib/models/journals.rb'
require_relative 'lib/combiner.rb'
require_relative 'lib/manager.rb'
require_relative 'lib/presenters/csv.rb'
require_relative 'lib/presenters/to_json.rb'

class Combine
  def call
    case input_handler.format
    when "json"
      to_json combined_files(*managers)
    when "csv"
      to_csv combined_files(*managers)
    else
      raise "wrong format"
    end
  end

  private

  def to_csv collection
    present(Presenters::Csv, collection)
  end

  def to_json collection
    present(Presenters::ToJson, collection)
  end

  def managers
    articles_manager = Manager.new(input_handler.articles, Models::Articles, Parsers::Csv,  FileProcessor::Csv)
    journals_manager = Manager.new(input_handler.journals, Models::Journals, Parsers::Csv,  FileProcessor::Csv)
    authors_manager  = Manager.new(input_handler.authors,  Models::Authors,  Parsers::Json, FileProcessor::Json)

    [articles_manager.call, journals_manager.call, authors_manager.call]
  end

  def combined_files articles, journals, authors
    combined_files = Combiner.new(articles, journals, authors)
    combined_files.call
  end

  def input_handler
    @input_handler ||= InputHandler.new
  end

  def present presenter_class, collection
    presenter = presenter_class.new collection
    presenter.call
  end
end

combine = Combine.new
combine.call