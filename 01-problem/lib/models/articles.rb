require_relative '../validators/articles/doi.rb'
require_relative '../validators/issn.rb'
require_relative '../validators/articles/title.rb'
require_relative '../initialitzator/nil_if_initialitzation_fails.rb'

module Models
  class Articles
    extend NilIfInitializationFails

    attr_reader :doi, :title, :issn
    
    def initialize data, doi_validator: Validators::Articles::Doi.new, title_validator: Validators::Articles::Title.new, issn_validator: Validators::Issn.new

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