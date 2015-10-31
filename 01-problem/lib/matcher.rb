class Matcher
  def initialize articles, journals, authors
    @articles = articles
    @journals = journals
    @authors  = authors
  end

  def call
  end

  attr_reader :articles, :journals, :authors
end