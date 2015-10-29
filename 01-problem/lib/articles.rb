class Articles
  def initialize data, doi_validator: validators::Doi.new, title_validator: validators::Title.new, issn_validator: validators::Issn.new
    @doi, @title, @issn = data

    @doi_validator   = doi_validator
    @title_validator = title_validator
    @issn_validator  = issn_validator
    
    raise_error unless valid?
  end

  attr_reader :doi, :title, :issn

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