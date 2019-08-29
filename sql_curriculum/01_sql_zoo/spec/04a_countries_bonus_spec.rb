require 'rspec'
require '04a_countries_bonus'

describe "countries bonus" do
  describe "highest_gdp" do
    it "selects countries with higher GDPs than all European countries" do
      expect(highest_gdp).to contain_exactly(
        ["Japan"],
        ["United States of America"]
      )
    end
  end

  describe "largest_in_continent" do
    it "selects the countries with the largest areas in their continents" do
      expect(largest_in_continent).to contain_exactly(
        ["South America", "Brazil", "8550000"],
        ["North America", "Canada", "9900000"],
        ["Asia-Pacific", "China", "9600000"],
        ["Africa", "Democratic Republic of Congo", "2340000"],
        ["South Asia", "India", "3100000"],
        ["Americas", "Nicaragua", "120254"],
        ["Europe", "Russia", "17000000"],
        ["Middle East", "Sudan", "2500000"]
      )
    end
  end

  describe "large_neighbors" do
    it "selects countries with much higher populations than their neighbors" do
      expect(large_neighbors).to contain_exactly(
        ["Brazil", "South America"],
        ["China", "Asia-Pacific"],
        ["India", "South Asia"]
      )
    end
  end
end
