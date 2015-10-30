require_relative '../validators/authors_name.rb'
require_relative '../validators/authors_articles.rb'
require_relative '../initialitzator/nil_if_initialitzation_fails.rb'
require 'pry'
module Resources
  class Authors
    extend NilIfInitializationFails
    
    attr_reader :articles, :name
    
    def initialize data, article_validator: Validators::AuthorsArticles.new, author_validator: Validators::AuthorsName.new
      @name     = data.fetch "name", "no_name"
      @articles = data.fetch "articles", "no_articles"

      @article_validator = article_validator
      @author_validator  = author_validator

      raise InitializationInvalidError unless valid?
    end

    private

    def valid?
      article_validator.call(articles) && author_validator.call(name)
    end

    attr_reader :article_validator, :author_validator
  end
end