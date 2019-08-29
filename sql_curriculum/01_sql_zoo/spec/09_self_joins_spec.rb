require 'rspec'
require '09_self_joins'

describe "self-JOIN exercises" do
  describe "num_stops" do
    it "shows the number of stops in the table" do
      expect(num_stops).to contain_exactly(["246"])
    end
  end

  describe "craiglockhart_id" do
    it "shows the ID of the stop Craiglockhart" do
      expect(craiglockhart_id).to contain_exactly(["53"])
    end
  end

  describe "lrt_stops" do
    it "shows the ids and names of stops on the 4 LRT service" do
      expect(lrt_stops).to contain_exactly(
        ["19", "Bingham"],
        ["177", "Northfield"],
        ["149", "London Road"],
        ["194", "Princes Street"],
        ["115", "Haymarket"],
        ["53", "Craiglockhart"],
        ["179", "Oxgangs"],
        ["85", "Fairmilehead"],
        ["117", "Hillend"]
      )
    end
  end

  describe "connecting_routes" do
    it "shows the routes that connect London Road with Craiglockhart" do
      expect(connecting_routes).to contain_exactly(
        ["LRT", "45", "2"],
        ["LRT", "4", "2"]
      )
    end
  end

  describe "cl_to_lr" do
    it "shows routes from Craiglockhart to London Road" do
      expect(cl_to_lr).to contain_exactly(
        ["LRT", "4", "53", "149"],
        ["LRT", "45", "53", "149"]
      )
    end
  end

  describe "cl_to_lr_by_name" do
    it "shows routes from Craiglockhart to London Road" do
      expect(cl_to_lr_by_name).to contain_exactly(
        ["LRT", "4", "Craiglockhart", "London Road"],
        ["LRT", "45", "Craiglockhart", "London Road"]
      )
    end
  end

  describe "haymarket_and_leith" do
    it "shows services connecting Haymarket and Leith" do
      expect(haymarket_and_leith).to contain_exactly(
        ["LRT", "12"],
        ["LRT", "2"],
        ["LRT", "22"],
        ["LRT", "25"],
        ["LRT", "2A"],
        ["SMT", "C5"]
      )
    end
  end

  describe "craiglockhart_and_tollcross" do
    it "shows services connecting Craiglockhart and Tollcross" do
      expect(craiglockhart_and_tollcross).to contain_exactly(
        ["LRT", "10"],
        ["LRT", "27"],
        ["LRT", "45"],
        ["LRT", "47"]
      )
    end
  end

  describe "start_at_craiglockhart" do
    it "shows stops that can be reached by taking one bus from Craiglockhart" do
      expect(start_at_craiglockhart).to contain_exactly(
        ["Bingham", "LRT", "4"],
        ["Northfield", "LRT", "4"],
        ["London Road", "LRT", "4"],
        ["Princes Street", "LRT", "4"],
        ["Haymarket", "LRT", "4"],
        ["Craiglockhart", "LRT", "4"],
        ["Oxgangs", "LRT", "4"],
        ["Fairmilehead", "LRT", "4"],
        ["Hillend", "LRT", "4"],
        ["Silverknowes", "LRT", "10"],
        ["Muirhouse", "LRT", "10"],
        ["Newhaven", "LRT", "10"],
        ["Leith", "LRT", "10"],
        ["Leith Walk", "LRT", "10"],
        ["Princes Street", "LRT", "10"],
        ["Tollcross", "LRT", "10"],
        ["Craiglockhart", "LRT", "10"],
        ["Colinton", "LRT", "10"],
        ["Torphin", "LRT", "10"],
        ["Silverknowes", "LRT", "27"],
        ["Crewe Toll", "LRT", "27"],
        ["Canonmills", "LRT", "27"],
        ["Hanover Street", "LRT", "27"],
        ["Tollcross", "LRT", "27"],
        ["Craiglockhart", "LRT", "27"],
        ["Oxgangs", "LRT", "27"],
        ["Hunters Tryst", "LRT", "27"],
        ["Brunstane", "LRT", "45"],
        ["Duddingston", "LRT", "45"],
        ["Northfield", "LRT", "45"],
        ["London Road", "LRT", "45"],
        ["Hanover Street", "LRT", "45"],
        ["Tollcross", "LRT", "45"],
        ["Craiglockhart", "LRT", "45"],
        ["Colinton", "LRT", "45"],
        ["Currie", "LRT", "45"],
        ["Riccarton Campus", "LRT", "45"],
        ["Canonmills", "LRT", "47"],
        ["Hanover Street", "LRT", "47"],
        ["Tollcross", "LRT", "47"],
        ["Craiglockhart", "LRT", "47"],
        ["Colinton", "LRT", "47"],
        ["Currie", "LRT", "47"],
        ["Balerno", "LRT", "47"],
        ["Cockburn Crescent", "LRT", "47"],
        ["Balerno Church", "LRT", "47"]
      )
    end
  end

  describe "craiglockhart_to_sighthill" do
    it "shows routes involving two buses from Craiglockhart to Sighthill" do
      expect(craiglockhart_to_sighthill).to contain_exactly(
        ["4", "LRT", "London Road", "34", "LRT"],
        ["4", "LRT", "London Road", "35", "LRT"],
        ["4", "LRT", "London Road", "65", "LRT"],
        ["4", "LRT", "London Road", "C5", "SMT"],
        ["4", "LRT", "Princes Street", "3", "LRT"],
        ["4", "LRT", "Princes Street", "30", "LRT"],
        ["4", "LRT", "Princes Street", "3A", "LRJ"],
        ["4", "LRT", "Princes Street", "65", "LRT"],
        ["4", "LRT", "Princes Street", "C5", "SMT"],
        ["4", "LRT", "Princes Street", "C70", "SMT"],
        ["4", "LRT", "Haymarket", "22", "LRT"],
        ["4", "LRT", "Haymarket", "22A", "LRT"],
        ["4", "LRT", "Haymarket", "25", "LRT"],
        ["4", "LRT", "Haymarket", "3", "LRT"],
        ["4", "LRT", "Haymarket", "30", "LRT"],
        ["4", "LRT", "Haymarket", "3A", "LRJ"],
        ["4", "LRT", "Haymarket", "61", "LRT"],
        ["4", "LRT", "Haymarket", "61", "SMT"],
        ["4", "LRT", "Haymarket", "65", "LRT"],
        ["4", "LRT", "Haymarket", "C5", "SMT"],
        ["4", "LRT", "Haymarket", "C70", "SMT"],
        ["4", "LRT", "Oxgangs", "32", "LRT"],
        ["4", "LRT", "Oxgangs", "52", "LRT"],
        ["4", "LRT", "Fairmilehead", "32", "LRT"],
        ["4", "LRT", "Fairmilehead", "52", "LRT"],
        ["10", "LRT", "Muirhouse", "32", "LRT"],
        ["10", "LRT", "Muirhouse", "52", "LRT"],
        ["10", "LRT", "Newhaven", "22", "LRT"],
        ["10", "LRT", "Newhaven", "25", "LRT"],
        ["10", "LRT", "Newhaven", "32", "LRT"],
        ["10", "LRT", "Newhaven", "52", "LRT"],
        ["10", "LRT", "Leith", "22", "LRT"],
        ["10", "LRT", "Leith", "25", "LRT"],
        ["10", "LRT", "Leith", "32", "LRT"],
        ["10", "LRT", "Leith", "34", "LRT"],
        ["10", "LRT", "Leith", "35", "LRT"],
        ["10", "LRT", "Leith", "52", "LRT"],
        ["10", "LRT", "Leith", "C5", "SMT"],
        ["10", "LRT", "Leith Walk", "22", "LRT"],
        ["10", "LRT", "Leith Walk", "22A", "LRT"],
        ["10", "LRT", "Leith Walk", "25", "LRT"],
        ["10", "LRT", "Princes Street", "3", "LRT"],
        ["10", "LRT", "Princes Street", "30", "LRT"],
        ["10", "LRT", "Princes Street", "3A", "LRJ"],
        ["10", "LRT", "Princes Street", "65", "LRT"],
        ["10", "LRT", "Princes Street", "C5", "SMT"],
        ["10", "LRT", "Princes Street", "C70", "SMT"],
        ["10", "LRT", "Colinton", "32", "LRT"],
        ["10", "LRT", "Colinton", "52", "LRT"],
        ["27", "LRT", "Canonmills", "34", "LRT"],
        ["27", "LRT", "Canonmills", "35", "LRT"],
        ["27", "LRT", "Oxgangs", "32", "LRT"],
        ["27", "LRT", "Oxgangs", "52", "LRT"],
        ["45", "LRT", "Brunstane", "32", "LRT"],
        ["45", "LRT", "Brunstane", "52", "LRT"],
        ["45", "LRT", "London Road", "34", "LRT"],
        ["45", "LRT", "London Road", "35", "LRT"],
        ["45", "LRT", "London Road", "65", "LRT"],
        ["45", "LRT", "London Road", "C5", "SMT"],
        ["45", "LRT", "Colinton", "32", "LRT"],
        ["45", "LRT", "Colinton", "52", "LRT"],
        ["45", "LRT", "Currie", "61", "LRT"],
        ["45", "LRT", "Riccarton Campus", "22A", "LRT"],
        ["45", "LRT", "Riccarton Campus", "61", "SMT"],
        ["45", "LRT", "Riccarton Campus", "65", "LRT"],
        ["47", "LRT", "Canonmills", "34", "LRT"],
        ["47", "LRT", "Canonmills", "35", "LRT"],
        ["47", "LRT", "Colinton", "32", "LRT"],
        ["47", "LRT", "Colinton", "52", "LRT"],
        ["47", "LRT", "Currie", "61", "LRT"]
      )
    end
  end
end
