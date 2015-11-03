require_relative '../operations/hyphen_standaritzation.rb'

module Models
  class Article
    include HyphenStandaritzation
    
    attr_reader :doi, :title, :issn
    
    def initialize data
      @doi    = data.first
      @title  = data[1]
      @issn   = hyphen_standart data.last
    end
  end
end