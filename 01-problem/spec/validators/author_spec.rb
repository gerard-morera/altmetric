require 'validators/author'

describe Validators::Author do
  let(:data)  { {"name"=>"Gerard","articles"=>["first", "second"]} } 

  let(:articles_validator) { double 'articles_validator' }
  let(:name_validator)     { double 'name_validator' }
  let(:validator)          { double 'validator' }

  subject do 
    described_class.new(
      data,
      articles_validator:  articles_validator,
      name_validator:      name_validator
    )
  end

  before do
    allow(articles_validator).to receive(:new).
      and_return(validator)
    allow(validator).to receive(:call).
      and_return(true)
    allow(name_validator).to receive(:new).
      and_return(validator)
    allow(validator).to receive(:call).
      and_return(validator_answer)
  end


  describe 'call' do
    context "when all validatros return true" do
      let(:validator_answer) { true }

      it 'returns true' do
        expect(subject.call).to eq true
      end
    end

    context "when any validator returns false" do
      let(:validator_answer) { false }

      it 'returns false' do
        expect(subject.call).to eq false
      end
    end
  end
end