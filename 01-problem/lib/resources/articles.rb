require_relative '../validators/doi.rb'
require_relative '../validators/issn.rb'
require_relative '../validators/articles_title.rb'

class InitializationInvalidError < StandardError; end

module Resources
  class Articles
    attr_reader :doi, :title, :issn

    def self.new_if_valid data
      self.new data
    rescue InitializationInvalidError
      nil
    end
    
    def initialize data, doi_validator: Validators::Doi.new, title_validator: Validators::ArticlesTitle.new, issn_validator: Validators::Issn.new
      @doi, @title, @issn = data

      @doi_validator   = doi_validator
      @title_validator = title_validator
      @issn_validator  = issn_validator

      raise InitializationInvalidError unless valid?
    end

    private

    def valid?
      (
        doi_validator.call(doi) && 
        title_validator.call(title) && 
        issn_validator.call(issn)
      )
    end

    attr_reader :doi_validator, :title_validator, :issn_validator
  end
end