require_relative './properties/articles.rb'
require_relative './properties/name.rb'

module Validators
  class Author
    def initialize data, articles_validator: Validators::Properties::Articles, name_validator: Validators::Properties::Name
      @name      = data.fetch "name"
      @articles  = data.fetch "articles"

      @articles_validator = articles_validator
      @name_validator     = name_validator
    end

    def call
      articles_valid? and name_valid?
    end

    private

    def articles_valid?
      validator = articles_validator.new articles
      validator.call
    end

    def name_valid?
      validator = name_validator.new name
      validator.call
    end

    attr_reader :articles, :name, :articles_validator, :name_validator
  end
end