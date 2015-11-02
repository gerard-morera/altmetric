require 'models/authors'

describe Models::Authors do
  let(:data) { {"name"=>"Gerard","articles"=>["Ruby","Elixir"]} }
  let(:article_validator) { double 'article_validator' }
  let(:author_validator)  { double 'author_validator' }

  subject do 
    described_class.new(
      data, 
      article_validator: article_validator, 
      author_validator:  author_validator, 
    )
  end

  context "with invalid data" do
    before do
      allow(data).to receive(:fetch)
      allow(article_validator).to receive(:call).
        and_return(false)
    end

    it 'returns nil' do
      expect(described_class.new_if_valid(data, article_validator: article_validator)).to eq nil
    end
  end

  context "with valid data" do
    before do
      allow(data).to receive(:fetch)
      allow(article_validator).to receive(:call).
        and_return(true)
      allow(author_validator).to receive(:call).
        and_return(true)
    end
    it 'returns the articles' do
      expect(subject.articles).to eq(["Ruby","Elixir"])
    end

    it 'returns the author' do
      expect(subject.name).to eq("Gerard")
    end
  end
end