class Matcher
  def initialize articles, journals, authors
    @articles = articles.compact
    @journals = journals.compact
    @authors  = authors.compact
  end

  def call
    articles.each_with_object([]) do |article, accum|
      accum << [article.doi, article.title, article.issn, author_doi(article.doi), journal_issn(article.issn)]
    end
  end


  def author_doi matcher
    authors.find do |author|
      author.articles.include? matcher
    end.name
  end

  def journal_issn matcher
    journals.find do |journal|
      journal.issn == matcher
    end
  end

  def journal matcher
    journal = (journal_issn(matcher) || NullJournal.new)
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