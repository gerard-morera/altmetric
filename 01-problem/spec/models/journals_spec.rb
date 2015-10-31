require 'models/journals'

describe Models::Journals do
  let(:data)            { ['title', 'issn'] }
  
  let(:title_validator) { double 'title_validator' }
  let(:issn_validator)  { double 'issn_validator' }
  
  subject do 
    described_class.new(
      data, 
      title_validator: title_validator, 
      issn_validator:  issn_validator
    )
  end

  context 'when any instance variable non valid' do
    before do 
      allow(title_validator).to receive(:call).
        and_return(false)
    end

    it 'returns nil' do
      expect(described_class.new_if_valid(data)).to eq nil
    end
  end

  context 'when any instance variable non valid' do
    before do
      allow(title_validator).to receive(:call).
        and_return(true)
      allow(issn_validator).to receive(:call).
        and_return(true)
    end

    it 'returns the title' do
      expect(subject.title).to eq data.first
    end

    it 'returns the issn' do
      expect(subject.issn).to eq data.last
    end
  end
end