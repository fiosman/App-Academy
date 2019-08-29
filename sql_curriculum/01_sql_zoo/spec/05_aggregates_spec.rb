require 'rspec'
require '05_aggregates'

describe "Aggregate queries" do
  describe "continents" do
    it "lists all the continents once each" do
      expect(continents).to contain_exactly(
        ["South Asia"],
        ["Europe"],
        ["Middle East"],
        ["Africa"],
        ["Americas"],
        ["South America"],
        ["Asia-Pacific"],
        ["North America"]
      )
    end
  end

  describe "africa_gdp" do
    it "gives the total GDP of Africa" do
      expect(africa_gdp).to contain_exactly(
        ["410196200000"]
      )
    end
  end

  describe "area_count" do
    it "selects the countries with an area of more than 1 million" do
      expect(area_count).to contain_exactly(
        ["28"]
      )
    end
  end

  describe "group_population" do
    it "sums the population for the given countries" do
      expect(group_population).to contain_exactly(
        ["187300000"]
      )
    end
  end

  describe "country_counts" do
    it "shows the name and number of countries of each continent" do
      expect(country_counts).to contain_exactly(
        ["Africa", "47"],
        ["Americas", "20"],
        ["Asia-Pacific", "36"],
        ["Europe", "48"],
        ["Middle East", "19"],
        ["North America", "3"],
        ["South America", "12"],
        ["South Asia", "8"]
      )
    end
  end

  describe "populous_country_counts" do
    it "shows the number of populous countries for each continent" do
      expect(populous_country_counts).to contain_exactly(
        ["Africa", "21"],
        ["Americas", "2"],
        ["Asia-Pacific", "15"],
        ["Europe", "16"],
        ["Middle East", "10"],
        ["North America", "3"],
        ["South America", "7"],
        ["South Asia", "6"]
      )
    end
  end

  describe "populous_continents" do
    it "shows the continents with total populations over 100 million" do
      expect(populous_continents).to contain_exactly(
        ["Africa"],
        ["Asia-Pacific"],
        ["Europe"],
        ["Middle East"],
        ["North America"],
        ["South America"],
        ["South Asia"]
      )
    end
  end
end
