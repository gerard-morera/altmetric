class Journals
  def initialize data, title_validator: validators::Title.new, issn_validator: validators::Issn.new
    @title, @issn = data

    @title_validator = title_validator
    @issn_validator  = issn_validator
    
    raise_error unless valid?
  end

  attr_reader :title, :issn

  private

  def valid?
    title_validator.call(title) && issn_validator.call(issn)
  end

  attr_reader :title_validator, :issn_validator
end