# require 'resources/authors'

# describe Resources::Authors do
#   let(:data) { [] }
#   let(:article_validator) { double 'article_validator' }

#   subject do 
#     described_class.new(
#       data, 
#       article_validator: article_validator, 
#       author_validator:  author_validator, 
#     )
#   end

#   context "with valid data" do
#     before do
#       allow(data).to receive(:fetch)
#       allow(article_validator).to receive(:call).
#         and_return(false)
#     end

#     it 'returns nil' do
#       # foo = described_class.new_if_valid(data)
#       # p foo.instance_variable_get(:@article_validator)
#       expect(described_class.new_if_valid(data)).to eq nil
#     end
#   end

#   context "with invalid data" do
#   end
# end