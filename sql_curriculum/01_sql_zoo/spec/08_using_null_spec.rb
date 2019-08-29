require 'rspec'
require '08_using_null.rb'

describe "using NULL" do
  describe "null_dept" do
    it "selects teachers who have NULL as their department" do
      expect(null_dept).to contain_exactly(["Spiregrain"], ["Deadyawn"])
    end
  end

  describe "all_teachers_join" do
    it "displays all of the teachers in a joined table" do
      expect(all_teachers_join).to contain_exactly(
        ["Shrivell", "Computing"],
        ["Throd", "Computing"],
        ["Splint", "Computing"],
        ["Spiregrain", nil],
        ["Cutflower", "Design"],
        ["Deadyawn", nil]
      )
    end
  end

  describe "all_depts_join" do
    it "displays all of the departments in a joined table" do
      expect(all_depts_join).to contain_exactly(
        ["Shrivell", "Computing"],
        ["Throd", "Computing"],
        ["Splint", "Computing"],
        ["Cutflower", "Design"],
        [nil, "Engineering"]
      )
    end
  end

  describe "teachers_and_mobiles" do
    it "displays teachers' mobile numbers, or a default if none exists" do
      expect(teachers_and_mobiles).to contain_exactly(
        ["Shrivell", "07966 555 1234"],
        ["Throd", "07122 555 1920"],
        ["Splint", "07986 444 2266"],
        ["Spiregrain", "07986 444 2266"],
        ["Cutflower", "07966 555 6574"],
        ["Deadyawn", "07986 444 2266"]
      )
    end
  end

  describe "teachers_and_depts" do
    it "displays teachers and their departments, or 'None' if they have none" do
      expect(teachers_and_depts).to contain_exactly(
        ["Shrivell", "Computing"],
        ["Throd", "Computing"],
        ["Splint", "Computing"],
        ["Spiregrain", "None"],
        ["Cutflower", "Design"],
        ["Deadyawn", "None"]
      )
    end
  end

  describe "num_teachers_and_mobiles" do
    it "shows the number of teachers and the number of mobile numbers" do
      expect(num_teachers_and_mobiles).to contain_exactly(["6", "3"])
    end
  end

  describe "dept_staff_counts" do
    it "shows the name and number of staff of each department" do
      expect(dept_staff_counts).to contain_exactly(
        ["Computing", "3"],
        ["Design", "1"],
        ["Engineering", "0"]
      )
    end
  end

  describe "teachers_and_divisions" do
    it "shows the name and division of teachers" do
      expect(teachers_and_divisions).to contain_exactly(
        ["Shrivell", "Sci"],
        ["Throd", "Sci"],
        ["Splint", "Sci"],
        ["Spiregrain", "Art"],
        ["Cutflower", "Sci"],
        ["Deadyawn", "Art"]
      )
    end
  end

  describe "teachers_and_divisions_two" do
    it "shows the name and division of teachers, or 'None' if they have none" do
      expect(teachers_and_divisions_two).to contain_exactly(
        ["Shrivell", "Sci"],
        ["Throd", "Sci"],
        ["Splint", "Sci"],
        ["Spiregrain", "None"],
        ["Cutflower", "Sci"],
        ["Deadyawn", "None"]
      )
    end
  end
end
