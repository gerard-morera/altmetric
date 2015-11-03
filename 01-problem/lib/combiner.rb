class Combiner
  def initialize articles, journals, authors
    @articles = articles.compact
    @journals = journals.compact
    @authors  = authors.compact
  end

  def call
    articles.each_with_object([]) do |article, accum|
      accum << attributes(article)
    end
  end

  private

  def attributes article
    [ 
      article.doi, 
      article.title, 
      article.issn, 
      get_author_name(article.doi), 
      get_journal_title(article.issn)
    ]
  end

  def get_author_name matcher
    author_for(matcher).name
  end

  def get_journal_title matcher
    journal_for(matcher).title
  end

  def author_for matcher 
    existing_author_for(matcher) || NullAuthor.new
  end

  def journal_for matcher
    existing_journal_for(matcher) || NullJournal.new
  end

  def existing_author_for matcher
    authors.find do |author|
      author.articles.include? matcher 
    end
  end

  def existing_journal_for matcher
    journals.find do |journal|
      journal.issn == matcher
    end
  end

  attr_reader :articles, :journals, :authors
end

class NullJournal
  def title
    "No journal"
  end
end

class NullAuthor
  def title
    "No title"
  end
end