require "string_calculator"

RSpec.describe StringCalculator do
  subject(:calc) { described_class.new }

  describe "#add" do
    it 'returns 0 for an empty string: "" => 0' do
      expect(calc.add("")).to eq(0)
    end
  end
end