module Models
  class Author
    attr_reader :articles, :name
    
    def initialize data
      @name     = data.fetch "name", "no_name"
      @articles = data.fetch "articles", "no_articles"
    end
  end
end