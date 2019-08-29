require 'rspec'
require '07a_joins_bonus'

describe "music JOINs" do
  describe "alison_artist" do
    it "selects the artist who recorded 'Alison'" do
      expect(alison_artist).to contain_exactly(
        ["Elvis Costello"]
      )
    end
  end

  describe "exodus_artist" do
    it "selects the artist who recorded 'Exodus'" do
      expect(exodus_artist).to contain_exactly(
        ["Bob Marley"]
      )
    end
  end

  describe "blur_songs" do
    it "selects the songs on the album 'Blur'" do
      expect(blur_songs).to contain_exactly(
        ["Beetlebum"],
        ["Song 2"],
        ["Country Sad Ballad Man"],
        ["M.O.R."],
        ["On Your Own"],
        ["Theme From Retro"],
        ["You're So Great"],
        ["Death Of A Party"],
        ["Chinese Bombs"],
        ["I'm Just A Killer For Your Love"],
        ["Look Inside America"],
        ["Strange News From Another Star"],
        ["Movin' On"],
        ["Essex Dogs"]
      )
    end
  end

  describe "heart_tracks" do
    it "selects albums with songs containing the word 'Heart'" do
      expect(heart_tracks).to eq([
        ["Bing! His Legendary Years, 1931 to 1957 [BOX SET]", "5"],
        ["The Greatest Hits", "4"],
        ["Forty Years-Artistry of Tony B", "3"],
        ["50 Worldwide Gold HitsVolume 1, Parts 1 & 2", "2"],
        ["Baby One More Time [ENHANCED CD]", "2"],
        ["BasherThe Best of Nick Lowe", "2"],
        ["San Francisco Days", "2"],
        ["Sgt. Pepper's Lonely Hearts Club Band", "2"],
        ["The Dionne Warwick CollectionHer All-Time Greatest", "2"],
        ["The Mel TormCollection [BOX SET]", "2"],
        ["Believe", "1"],
        ["Best Of", "1"],
        ["Blood on the Tracks", "1"],
        ["Eurythmics - Greatest Hits", "1"],
        ["Greatest HitsKing of Cool", "1"],
        ["Handel - Messiah / Nelson Kirkby Watkinson", "1"],
        ["I Left My Heart in San Francisco", "1"],
        ["Judy at Carnegie Hall [LIVE]", "1"],
        ["Les MiserablesOriginal London Cast Recording [CAST", "1"],
        ["Let's Talk About Love [ENHANCED CD]", "1"],
        ["Millennium", "1"],
        ["N Sync", "1"],
        ["Parallel Lines", "1"],
        ["Sevens", "1"],
        ["Singles 45's and Under", "1"],
        ["The Best...So Far", "1"],
        ["The Capitol Years", "1"],
        ["The Immaculate Collection", "1"],
        ["TitanicMusic from the Motion Picture (1997) [SOUND", "1"],
        ["Top Ten Hits", "1"],
        ["Wide Open Spaces", "1"],
        ["Yellow Submarine [ORIGINAL RECORDING REMASTERED]", "1"]
      ])
    end
  end

  describe "title_tracks" do
    it "selects the names of all title tracks" do
      expect(title_tracks).to contain_exactly(
        ["Mellon Collie and the Infinite Sadness"],
        ["Come on Over"],
        ["I Left My Heart in San Francisco"],
        ["Highway 61 Revisited"],
        ["Born to Run"],
        ["London Calling"],
        ["Thriller"],
        ["Born in the U.S.A."],
        ["Faith"],
        ["Falling into You"],
        ["Butterfly"],
        ["Wide Open Spaces"],
        ["Hotel California"],
        ["Master of Puppets"],
        ["Little Earthquakes"],
        ["Mack the Knife"],
        ["Sail Away"],
        ["Moondance"],
        ["Watermark"],
        ["San Francisco Days"],
        ["Graceland"],
        ["Ray of Light"],
        ["Are You Experienced?"],
        ["Sgt. Pepper's Lonely Hearts Club Band"],
        ["In It for the Money"],
        ["Fumbling Towards Ecstasy"],
        ["Buena Vista Social Club"],
        ["The Miseducation Of Lauryn Hill"],
        ["Believe"]
      )
    end
  end

  describe "eponymous_albums" do
    it "selects the names of all eponymous albums" do
      expect(eponymous_albums).to contain_exactly(
        ["Blur"],
        ["Toni Braxton"],
        ["Metallica"],
        ["The Doors"]
      )
    end
  end

  describe "song_title_counts" do
    it "selects the names and counts of songs that appear on more than two albums" do
      expect(song_title_counts).to contain_exactly(
        ["Angel", "3"],
        ["Best Is Yet to Come", "3"],
        ["Dancing in the Dark", "3"],
        ["From This Moment On", "4"],
        ["I Love You", "4"],
        ["I've Got You Under My Skin", "3"],
        ["One", "3"],
        ["Smile", "5"],
        ["Too Much", "3"]
      )
    end
  end

  describe "best_value" do
    it "selects the title, price, and track count of high-value albums" do
      expect(best_value).to contain_exactly(
        ["First Issue-Dinah Washington S", "22.98", "46"],
        ["Darlings of Wapping Wharf Launderette", "14.99", "50"],
        ["Forty Years-Artistry of Tony B", "35.99", "87"],
        ["The Capitol Years", "34.99", "75"],
        ["BasherThe Best of Nick Lowe", "11.98", "25"],
        ["The Greatest Hits", "22.99", "54"],
        ["Under the Table & Dreaming", "13.49", "34"]
      )
    end
  end

  describe "top_track_counts" do
    it "selects the titles and track counts of large albums" do
      expect(top_track_counts).to eq([
        ["Wagner - Der Ring des Nibelungen (Ring Cycle) / Si", "173"],
        ["Bing! His Legendary Years, 1931 to 1957 [BOX SET]", "101"],
        ["The Mel TormCollection [BOX SET]", "92"],
        ["Forty Years-Artistry of Tony B", "87"],
        ["The Capitol Years", "75"],
        ["The Greatest Hits", "54"],
        ["The Beatles (The White Album)", "53"],
        ["Darlings of Wapping Wharf Launderette", "50"],
        ["50 by Bobby Short", "50"],
        ["First Issue-Dinah Washington S", "46"]
      ])
    end
  end

  describe "rock_superstars" do
    it "selects the name of the most prolific rock artist" do
      expect(rock_superstars).to contain_exactly(
        ["The Beatles", "7"]
      )
    end
  end

  describe "expensive_tastes" do
    it "selects the five genres that cost the most per track" do
      expect(expensive_tastes).to eq([
        ["Styles > Classical > Forms & Genres > Theatrical, Incidental & Program Music > Incidental Music", "2.3557142857142857"],
        ["Styles > Classical > Historical Periods > Romantic (c.1820-1910) > Ballets & Dances", "2.3557142857142857"],
        ["Styles > Classical > Historical Periods > Romantic (c.1820-1910) > Forms & Genres > Theatrical, Inci", "2.3557142857142857"],
        ["Styles > Classical > Forms & Genres > Symphonies > Romantic", "1.8980000000000000"],
        ["Styles > Classical > Symphonies > General", "1.8980000000000000"]
      ])
    end
  end
end
