require_relative '../operations/hyphen_standaritzation.rb'

module Models
  class Article
    include HyphenStandaritzation
    
    attr_reader :doi, :title, :issn
    
    def initialize doi, title, issn
      @doi    = doi
      @title  = title
      @issn   = hyphen_standaritzation_for issn
    end
  end
end