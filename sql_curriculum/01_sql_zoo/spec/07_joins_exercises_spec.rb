require 'rspec'
require '07_joins_exercises'

describe "JOIN exercises" do
  describe "ford_films" do
    it "selects films in which actor Harrison Ford played" do
      expect(ford_films).to contain_exactly(
        ["Frantic"],
        ["Mosquito Coast, The"],
        ["Random Hearts"],
        ["Regarding Henry"],
        ["Presumed Innocent"],
        ["Witness"],
        ["Raiders of the Lost Ark"],
        ["Indiana Jones and the Temple of Doom"],
        ["Patriot Games"],
        ["Fugitive, The"],
        ["Indiana Jones and the Last Crusade"],
        ["Star Wars: Episode V - The Empire Strikes Back"],
        ["Star Wars: Episode VI - Return of the Jedi"],
        ["Clear and Present Danger"],
        ["Star Wars"],
        ["Blade Runner"],
        ["Apocalypse Now"],
        ["Air Force One"],
        ["Devil's Own, The"],
        ["Sabrina"],
        ["American Graffiti"],
        ["Six Days Seven Nights"],
        ["Conversation, The"],
        ["What Lies Beneath"],
        ["Working Girl"]
      )
    end
  end

  describe "ford_supporting_films" do
    it "selects films in which Harrison Ford played but did not lead" do
      expect(ford_supporting_films).to contain_exactly(
        ["Star Wars: Episode V - The Empire Strikes Back"],
        ["Star Wars: Episode VI - Return of the Jedi"],
        ["Star Wars"],
        ["Apocalypse Now"],
        ["American Graffiti"],
        ["Conversation, The"]
      )
    end
  end

  describe "films_and_stars_from_sixty_two" do
    it "lists the titles and stars of all 1962 films" do
      expect(films_and_stars_from_sixty_two).to contain_exactly(
        ["Dr. No", "Sean Connery"],
        ["Cape Fear", "Gregory Peck"],
        ["To Kill a Mockingbird", "Gregory Peck"],
        ["What Ever Happened to Baby Jane?", "Bette Davis"],
        ["Music Man, The", "Robert Preston (I)"]
      )
    end
  end

  describe "travoltas_busiest_years" do
    it "selects the year and number of movies of John Travolta's busy years" do
      expect(travoltas_busiest_years).to contain_exactly(
        ["1996", "2"],
        ["1998", "2"]
      )
    end
  end

  describe "andrews_films_and_leads" do
    it "selects the titles and lead actors of films Julie Andrews played in" do
      expect(andrews_films_and_leads).to contain_exactly(
        ["10", "Dudley Moore"],
        ["Sound of Music, The", "Julie Andrews"],
        ["Victor/Victoria", "Julie Andrews"]
      )
    end
  end

  describe "prolific_actors" do
    it "selects and orders the actors who have had at least 15 starring roles" do
      expect(prolific_actors).to eq([
        ["Al Pacino"],
        ["Arnold Schwarzenegger"],
        ["Clint Eastwood"],
        ["Harrison Ford"],
        ["Robert De Niro"],
        ["Robin Williams"],
        ["Sean Connery"],
        ["Sylvester Stallone"],
        ["Tom Hanks"]
      ])
    end
  end

  describe "films_by_cast_size" do
    it "selects 1978 films and orders by cast size" do
      expect(films_by_cast_size).to eq([
        ["Death on the Nile", "12"],
        ["Capricorn One", "11"],
        ["Foul Play", "11"],
        ["Heaven Can Wait", "11"],
        ["Animal House", "9"],
        ["Boys from Brazil, The", "9"],
        ["Midnight Express", "9"],
        ["Superman", "9"],
        ["Watership Down", "9"],
        ["Deer Hunter, The", "8"],
        ["Grease", "8"],
        ["Halloween", "8"],
        ["Attack of the Killer Tomatoes!", "7"],
        ["Coma", "7"],
        ["Damien: Omen II", "7"],
        ["Days of Heaven", "6"],
        ["Up in Smoke", "6"],
        ["Dawn of the Dead", "5"]
      ])
    end
  end

  describe "colleagues_of_garfunkel" do
    it "selects actors who have worked with Art Garfunkel" do
      expect(colleagues_of_garfunkel).to contain_exactly(
        ["Jon Voight"],
        ["Orson Welles"],
        ["Martin Sheen"],
        ["Richard Benjamin"],
        ["Martin Balsam"],
        ["Alan Arkin"],
        ["Bob Balaban"],
        ["Anthony Perkins"],
        ["Jack Gilford"],
        ["Buck Henry"],
        ["Norman Fell"],
        ["Bob Newhart"],
        ["Bill Paxton"],
        ["Kurtwood Smith"],
        ["Julian Sands"],
        ["Sherilyn Fenn"]
      )
    end
  end
end
