require 'validators/article'

describe Validators::Article do
  let(:data)  { double 'data' }
  let(:doi)   { double 'doi'}
  let(:title) { double 'title'}
  let(:issn)  { double 'issn'}

  let(:doi_validator)   { double 'doi_validator' }
  let(:title_validator) { double 'title_validator' }
  let(:issn_validator)  { double 'issn_validator' }

  let(:validator)        { double 'validator' }

  subject do 
    described_class.new(
      data,
      doi_validator:   doi_validator,
      title_validator: title_validator,
      issn_validator:  issn_validator
      )
  end

  before do
    allow(doi_validator).to receive(:new).
      and_return(validator)
    allow(validator).to receive(:call).
      and_return(true)
    allow(title_validator).to receive(:new).
      and_return(validator)
    allow(validator).to receive(:call).
      and_return(true)
    allow(issn_validator).to receive(:new).
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