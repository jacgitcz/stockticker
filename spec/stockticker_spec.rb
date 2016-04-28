require_relative "../stockticker"

describe "stockticker" do
    it "returns error signal for invalid input" do
        expect(stockticker([])).to eq [-1,-1]
	expect(stockticker([5])).to eq [-1,-1]
	expect(stockticker([3,3])).to eq [-1,-1]
    end
    it "returns best buy day, best sell day" do
        expect(stockticker([1,9])).to eq [0,1]
    end
    it "handles various array lengths" do
        expect(stockticker([1,2,3,4,5,6,7,8,9])).to eq [0,8]
	expect(stockticker([9,5,7,3,10,1,11,6])).to eq [5,6]
	expect(stockticker([15,6,6,4,2,5,7,3,8,9,1])).to eq [4,9]
    end
end
