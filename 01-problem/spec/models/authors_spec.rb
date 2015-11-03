require 'models/author'

describe Models::Author do
  
  let(:data)     { {"name"=>"Gerard","articles"=>["first", "second"]} } 
  let(:name)     { {"name"=>"Gerard"} }
  let(:articles) { {"articles"=>["first", "second"]} }

  subject { described_class.new data }

  it 'returns the doi' do
    expect(subject.name).to eq("Gerard")
  end

  it 'returns the title' do
    expect(subject.articles).to eq(["first", "second"])
  end
end