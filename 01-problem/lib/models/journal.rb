require_relative '../operations/hyphen_standaritzation.rb'

module Models
  class Journal
    include HyphenStandaritzation

    attr_reader :title, :issn
    
    def initialize data
      @title = data.first
      @issn  = hyphen_standart data.last
    end
  end
end