require "string_calculator"

RSpec.describe StringCalculator do
  subject(:calc) { described_class.new }

  describe "#add" do
    it 'returns 0 for an empty string: "" => 0' do
      expect(calc.add("")).to eq(0)
    end

    it "returns the number for a single numeric string" do
      expect(calc.add("1")).to eq(1)
      expect(calc.add("7")).to eq(7)
    end

    it 'sums two comma-separated numbers: "1,2" => 3' do
      expect(calc.add("1,2")).to eq(3)
      expect(calc.add("10,5")).to eq(15)
    end
  end
end