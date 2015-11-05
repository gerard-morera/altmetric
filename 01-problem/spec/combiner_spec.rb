require 'combiner'

describe Combiner do
  subject {described_class.new articles, journals, authors}
  let(:articles) { [article_1, article_2] }
  let(:journals) { [journal_1] }
  let(:authors)  { [author_1] }

  let(:article_1) do 
    double   'article_1', 
    doi:     'doi_1',
    title:   'title_1',
    issn:    'issn_1'
  end 

  let(:article_2) do 
    double   'article_2', 
    doi:     'doi_2',
    title:   'title_2',
    issn:    'issn_2'
  end 

  let(:journal_1) do
    double 'journal_1',
    title: 'journal_title',
    issn:  'issn_2'
  end

  let(:author_articles) { ['doi_1'] }

  let(:author_1) do
    double 'author_1',
    name:  'author_name',
    articles: author_articles
  end

  describe 'call' do
    it 'build an array of arrays of articles with its properties' do
      expect(subject.call).to eq([["doi_1", "title_1", "issn_1", "author_name", "No journal"], ["doi_2", "title_2", "issn_2", "No name", "journal_title"]])
    end
  end
end
