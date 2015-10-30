require 'parsers/json'

describe Parsers::Json do
  let(:file)          { double 'file' }
  let(:complete_file) { double 'complete_file' }
  let(:complete_file_to_json) { [{"name"=>"gerard"}, {"name"=>"rob"}] }

  subject { described_class.new file }

  before do
    allow(File).to receive(:readlines).
      with(file).and_return(complete_file)

    allow(complete_file).to receive(:first)

    allow(JSON).to receive(:parse).
      with(complete_file.first).
      and_return(complete_file_to_json)
  end

  describe 'each' do
    yielded = []
    it 'yields elements of the array' do
      subject.each { |e| yielded << e }
      
      expect(yielded).to eq([{"name"=>"gerard"}, {"name"=>"rob"}])
    end
  end
end
