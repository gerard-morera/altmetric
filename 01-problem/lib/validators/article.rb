require_relative './properties/doi.rb'
require_relative './properties/title.rb'
require_relative './properties/issn.rb'

module Validators
  class Article
    def initialize data, doi_validator: Validators::Properties::Doi, title_validator: Validators::Properties::Title, issn_validator: Validators::Properties::Issn
      @doi, @title, @issn = data
      
      @doi_validator  = doi_validator
      @title_validator = title_validator
      @issn_validator = issn_validator
    end

    def call
      doi_valid? and title_valid? and issn_valid?
    end

    private

    def doi_valid?
      validator = doi_validator.new doi
      validator.call
    end

    def title_valid?
      validator = title_validator.new title
      validator.call
    end

    def issn_valid?
      validator = issn_validator.new issn
      validator.call
    end

    attr_reader :doi, :title, :issn, :doi_validator, :title_validator, :issn_validator
  end
end