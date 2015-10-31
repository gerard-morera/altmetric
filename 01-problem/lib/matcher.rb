class Matcher
  def initialize articles, journals, authors
    @articles = articles.compact
    @journals = journals.compact
    @authors  = authors.compact
  end

  def call
    articles.each_with_obj do |article, accum|
      accum << attributes(article)
    end
  end

  private

  def attributes article
    [ 
      article.doi, 
      article.title, 
      article.issn, 
      get_author(article.doi), 
      get_journal(article.issn)
    ]
  end

  def get_author matcher
    authors.find do |author|
      author.articles.include? matcher
    end.name
  end

  def get_journal matcher
    journals.find do |journal|
      journal.issn == matcher
    end
  end

  def journal matcher
    journal = (get_journal(matcher) || NullJournal.new)
    journal.title
  end

  def author matcher
   author = (author_doi(matcher) || NullAuthor.new)
   author.title 
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
    "No journal"
  end
end