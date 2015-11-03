require_relative '../validators/article.rb'
require_relative '../models/article.rb'

module Builders
  class Article
    def initialize data
      @data = data
    end

    def call
      Models::Article.new(*data) if valid?
    end

    private

    def valid?
      validator = Validators::Article.new data
      validator.call
    end

    attr_reader :data
  end
end