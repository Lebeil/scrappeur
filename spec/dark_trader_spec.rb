require_relative '../lib/dark_trader'


describe "the dark_trader method" do
  it "should return trader, and trader is not nil" do
    expect(dark_trader).not_to be_nil
  end
end