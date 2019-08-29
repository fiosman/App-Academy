require 'rspec'
require '03_select_nobel'

describe 'SELECT from nobel' do
  describe 'prizes_from_1950' do
    it 'selects nobel prizes from 1950' do
      expect(prizes_from_1950).to contain_exactly(
        ["1950", "Chemistry", "Kurt Alder"],
        ["1950", "Chemistry", "Otto Diels"],
        ["1950", "Literature", "Bertrand Russell"],
        ["1950", "Medicine", "Philip S. Hench"],
        ["1950", "Medicine", "Edward C. Kendall"],
        ["1950", "Medicine", "Tadeus Reichstein"],
        ["1950", "Peace", "Ralph Bunche"],
        ["1950", "Physics", "Cecil Powell"]
      )
    end
  end

  describe 'literature_1962' do
    it 'selects the winner of the literature prize in 1962' do
      expect(literature_1962).to contain_exactly(['John Steinbeck'])
    end
  end

  describe 'einstein_prize' do
    it 'selects the year and subject in which Albert Einstein won his prize' do
      expect(einstein_prize).to contain_exactly(["1921", "Physics"])
    end
  end

  describe 'millennial_peace_prizes' do
    it 'selects peace prize winners since 2000' do
      expect(millennial_peace_prizes).to contain_exactly(
        ["Martti Ahtisaari"],
        ["Intergovernmental Panel on Climate Change"],
        ["Al Gore"],
        ["Grameen Bank"],
        ["Muhammad Yunus"],
        ["International Atomic Energy Agency"],
        ["Mohamed ElBaradei"],
        ["Wangari Maathai"],
        ["Shirin Ebadi"],
        ["Jimmy Carter"],
        ["United Nations"],
        ["Kofi Annan"],
        ["Kim Dae-jung"]
      )
    end
  end

  describe 'eighties_literature' do
    it 'shows details of 1980s literature prize winners' do
      expect(eighties_literature).to contain_exactly(
        ["1989", "Literature", "Camilo JosÃ© Cela"],
        ["1988", "Literature", "Naguib Mahfouz"],
        ["1987", "Literature", "Joseph Brodsky"],
        ["1986", "Literature", "Wole Soyinka"],
        ["1985", "Literature", "Claude Simon"],
        ["1984", "Literature", "Jaroslav Seifert"],
        ["1983", "Literature", "William Golding"],
        ["1982", "Literature", "Gabriel GarcÃ­a MÃ¡rquez"],
        ["1981", "Literature", "Elias Canetti"],
        ["1980", "Literature", "Czeslaw Milosz"]
      )
    end
  end

  describe 'presidential_prizes' do
    it 'shows details of presidential Nobel winners' do
      expect(presidential_prizes).to contain_exactly(
        ["2002", "Peace", "Jimmy Carter"],
        ["1919", "Peace", "Woodrow Wilson"],
        ["1906", "Peace", "Theodore Roosevelt"]
      )
    end
  end

  describe 'nobel_johns' do
    it 'shows winners with the first name John' do
      expect(nobel_johns).to contain_exactly(
        ["John C. Mather"],
        ["John L. Hall"],
        ["John B. Fenn"],
        ["John E. Sulston"],
        ["John Pople"],
        ["John Hume"],
        ["John E. Walker"],
        ["John C. Harsanyi"],
        ["John F. Nash Jr."],
        ["John C. Polanyi"],
        ["John R. Vane"],
        ["John H. van Vleck"],
        ["John Cornforth"],
        ["John R. Hicks"],
        ["John Bardeen"],
        ["John C. Kendrew"],
        ["John Steinbeck"],
        ["John Bardeen"],
        ["John F. Enders"],
        ["John Cockcroft"],
        ["John H. Northrop"],
        ["John R. Mott"],
        ["John Galsworthy"],
        ["John Macleod"]
      )
    end
  end
end
