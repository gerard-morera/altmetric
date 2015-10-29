require 'articles'

describe Articles do
  let(:data)            { ['doi', 'title', 'issn'] }
  
  let(:doi_validator)   { double 'doi_validator' }
  let(:title_validator) { double 'title_validator' }
  let(:issn_validator)  { double 'issn_validator' }
  
  subject do 
    described_class.new(
      data, 
      doi_validator:   doi_validator, 
      title_validator: title_validator, 
      issn_validator:  issn_validator
    )
  end

  context 'when any instance variable non valid' do
    before do 
      allow(doi_validator).to receive(:call).
        and_return(false)
    end

    it 'raises and error' do
      expect { subject }.to raise_error
    end
  end

  context 'when any instance variable non valid' do
    before do
      allow(doi_validator).to receive(:call).
        and_return(true)
      allow(title_validator).to receive(:call).
        and_return(true)
      allow(issn_validator).to receive(:call).
        and_return(true)
    end

    it 'returns the doi' do
      expect(subject.doi).to eq data.first
    end

    it 'returns the title' do
      expect(subject.title).to eq data[1]
    end

    it 'returns the issn' do
      expect(subject.issn).to eq data.last
    end
  end
end