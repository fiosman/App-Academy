require 'rspec'
require '04_select_within_select'

describe "SELECT within SELECT" do
  describe "larger_than_russia" do
    it "selects countries with a population larger than Russia" do
      expect(larger_than_russia).to contain_exactly(
        ["Bangladesh"],
        ["Brazil"],
        ["China"],
        ["India"],
        ["Indonesia"],
        ["Pakistan"],
        ["United States of America"]
      )
    end
  end

  describe "richer_than_england" do
    it "selects countries with a higher per capita GDP than the UK" do
      expect(richer_than_england).to contain_exactly(
        ["Denmark"],
        ["Iceland"],
        ["Ireland"],
        ["Luxembourg"],
        ["Norway"],
        ["Sweden"],
        ["Switzerland"]
      )
    end
  end

  describe "neighbors_of_certain_b_countries" do
    it "selects the correct names and continents" do
      expect(neighbors_of_certain_b_countries).to contain_exactly(
        ["Albania", "Europe"],
        ["Andorra", "Europe"],
        ["Antigua and Barbuda", "Americas"],
        ["Armenia", "Europe"],
        ["Austria", "Europe"],
        ["Azerbaijan", "Europe"],
        ["Bahamas", "Americas"],
        ["Barbados", "Americas"],
        ["Belarus", "Europe"],
        ["Belgium", "Europe"],
        ["Belize", "Americas"],
        ["Bosnia-Hercegovina", "Europe"],
        ["Bulgaria", "Europe"],
        ["Costa Rica", "Americas"],
        ["Croatia", "Europe"],
        ["Cuba", "Americas"],
        ["Cyprus", "Europe"],
        ["Czech Republic", "Europe"],
        ["Denmark", "Europe"],
        ["Dominica", "Americas"],
        ["Dominican Republic", "Americas"],
        ["El Salvador", "Americas"],
        ["Estonia", "Europe"],
        ["Finland", "Europe"],
        ["Former Yugoslav Republic of Macedonia", "Europe"],
        ["France", "Europe"],
        ["Georgia", "Europe"],
        ["Germany", "Europe"],
        ["Greece", "Europe"],
        ["Grenada", "Americas"],
        ["Guatemala", "Americas"],
        ["Haiti", "Americas"],
        ["Honduras", "Americas"],
        ["Hungary", "Europe"],
        ["Iceland", "Europe"],
        ["Ireland", "Europe"],
        ["Italy", "Europe"],
        ["Jamaica", "Americas"],
        ["Latvia", "Europe"],
        ["Liechtenstein", "Europe"],
        ["Lithuania", "Europe"],
        ["Luxembourg", "Europe"],
        ["Malta", "Europe"],
        ["Moldova", "Europe"],
        ["Monaco", "Europe"],
        ["Nicaragua", "Americas"],
        ["Norway", "Europe"],
        ["Panama", "Americas"],
        ["Poland", "Europe"],
        ["Portugal", "Europe"],
        ["Romania", "Europe"],
        ["Russia", "Europe"],
        ["San Marino", "Europe"],
        ["Serbia and Montenegro", "Europe"],
        ["Slovakia", "Europe"],
        ["Slovenia", "Europe"],
        ["Spain", "Europe"],
        ["St Kitts and Nevis", "Americas"],
        ["St Lucia", "Americas"],
        ["St Vincent and the Grenadines", "Americas"],
        ["Sweden", "Europe"],
        ["Switzerland", "Europe"],
        ["The Netherlands", "Europe"],
        ["Trinidad and Tobago", "Americas"],
        ["Turkey", "Europe"],
        ["Ukraine", "Europe"],
        ["United Kingdom", "Europe"],
        ["Vatican", "Europe"]
      )
    end
  end

  describe "population_constraint" do
    it "selects countries with a population between Poland and Canada" do
      expect(population_constraint).to contain_exactly(
        ["Algeria", "32900000"],
        ["Kenya", "32800000"],
        ["Sudan", "35000000"],
        ["Tanzania", "38400000"]
      )
    end
  end

  describe "sparse_continents" do
    it "selects countries in sparsely populated continents" do
      expect(sparse_continents).to contain_exactly(
        ["Antigua and Barbuda", "Americas", "77000"],
        ["Bahamas", "Americas", "321000"],
        ["Barbados", "Americas", "272000"],
        ["Belize", "Americas", "266000"],
        ["Costa Rica", "Americas", "4300000"],
        ["Cuba", "Americas", "11300000"],
        ["Dominica", "Americas", "71000"],
        ["Dominican Republic", "Americas", "9000000"],
        ["El Salvador", "Americas", "6700000"],
        ["Grenada", "Americas", "103000"],
        ["Guatemala", "Americas", "13000000"],
        ["Haiti", "Americas", "8500000"],
        ["Honduras", "Americas", "7200000"],
        ["Jamaica", "Americas", "2700000"],
        ["Nicaragua", "Americas", "5700000"],
        ["Panama", "Americas", "3200000"],
        ["St Kitts and Nevis", "Americas", "46000"],
        ["St Lucia", "Americas", "152000"],
        ["St Vincent and the Grenadines", "Americas", "121000"],
        ["Trinidad and Tobago", "Americas", "1300000"]
      )
    end
  end
end
