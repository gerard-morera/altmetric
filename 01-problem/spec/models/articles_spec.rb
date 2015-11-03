require 'models/article'

describe Models::Article do
    
  let(:doi)   { double 'doi' }
  let(:title) { double 'title' }

  let(:issn)  { '1234-4321' }

  subject { described_class.new doi, title, issn}

  it 'returns the doi' do
    expect(subject.doi).to eq doi
  end

  it 'returns the title' do
    expect(subject.title).to eq title
  end

  context 'when issn has hyphen' do
    it 'returns the issn' do
      expect(subject.issn).to eq issn
    end
  end

  context 'when issn has not hyphen' do
    let(:issn)  { '12344321'}

    it 'returns the issn with hyphen' do
      expect(subject.issn).to eq('1234-4321')
    end
  end
end