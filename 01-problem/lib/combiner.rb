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
    author = authors.find do |author|
      author.articles.include? matcher
    end
    author.name
  end

  def get_journal_title matcher
    journal = journals.find do |journal|
      hyphen_proof(journal, matcher) 
    end
    (journal || NullJournal.new).title
  end

  def hyphen_proof journal, matcher
    issn = journal.issn
    if matcher.include?('-')
      (issn    == matcher) || (issn == without_hyphen(matcher))
    else
      (matcher == issn)    || (matcher == without_hyphen(issn))
    end
  end

  def without_hyphen matcher
    matcher.split('-').join
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
    "No title"
  end
end