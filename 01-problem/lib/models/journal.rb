require_relative '../operations/hyphen_standaritzation.rb'

module Models
  class Journal
    include HyphenStandaritzation

    attr_reader :title, :issn
    
    def initialize title, issn
      @title = title
      @issn  = hyphen_standaritzation_for issn
    end
  end
end