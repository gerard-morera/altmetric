require 'resources/authors'

describe Resources::Authors do
  let(:data) { [] }
  let(:article_validator) { double 'article_validator' }
  let(:author_validator) { double 'author_validator' }

  subject do 
    described_class.new(
      data, 
      article_validator: article_validator, 
      author_validator:  author_validator, 
    )
  end

  context "with valid data" do
    before do
      allow(data).to receive(:fetch)
      allow(article_validator).to receive(:call).
        and_return(false)
    end

    it 'returns nil' do
      expect(described_class.new_if_valid(data, article_validator: article_validator)).to eq nil
    end
  end

  context "with invalid data" do
  end
end