require_relative '../validators/authors/name.rb'
require_relative '../validators/authors/articles.rb'
require_relative '../initialitzator/nil_if_initialitzation_fails.rb'

module Resources
  class Authors
    extend NilIfInitializationFails
    
    attr_reader :articles, :name
    
    def initialize data, article_validator: Validators::Authors::Articles.new, author_validator: Validators::Authors::Name.new
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