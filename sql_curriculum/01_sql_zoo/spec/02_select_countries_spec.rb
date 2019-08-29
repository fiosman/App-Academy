require 'rspec'
require '02_select_countries'

describe 'SELECT from world' do
  describe 'large_countries' do
    it 'selects the names of countries with over 200 million people' do
      expect(large_countries).to contain_exactly(
        ["China"],
        ["India"],
        ["Indonesia"],
        ["United States of America"]
      )
    end
  end

  describe 'high_population_gdps' do
    it 'selects names and per capita GDPs' do
      expect(high_population_gdps).to contain_exactly(
        ["China", "1290"],
        ["India", "620"],
        ["Indonesia", "1140"],
        ["United States of America", "41400"]
      )
    end
  end

  describe 'population_in_millions' do
    it 'selects the population in millions of countries in South America' do
      expect(population_in_millions).to contain_exactly(
        ["Argentina", "39"],
        ["Bolivia", "9"],
        ["Brazil", "182"],
        ["Chile", "16"],
        ["Colombia", "45"],
        ["Ecuador", "13"],
        ["Guyana", "0"],
        ["Paraguay", "6"],
        ["Peru", "28"],
        ["Surinam", "0"],
        ["Uruguay", "3"],
        ["Venezuela", "26"]
      )
    end
  end

  describe 'name_and_population' do
    it 'selects the name and population of the specified countries' do
      expect(name_and_population).to contain_exactly(
        ["France", "60700000"],
        ["Germany", "82500000"],
        ["Italy", "57200000"]  
      )
    end
  end

  describe 'united_we_stand' do
    it 'shows countries whose names contain "United"' do
      expect(united_we_stand).to contain_exactly(
        ["United Arab Emirates"],
        ["United Kingdom"],
        ["United States of America"] 
      )
    end
  end
end
