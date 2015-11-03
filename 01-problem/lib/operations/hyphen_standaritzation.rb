module HyphenStandaritzation
  def hyphen_standaritzation_for issn
    if issn.include?('-')
      issn
    else
      add_hyphen_to issn
    end
  end

  private

  def add_hyphen_to issn
    issn_sliced = [issn.slice(0..3), issn.slice(4..-1)]
    issn_sliced.join('-')
  end
end