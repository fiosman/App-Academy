require_relative 'questions_database'

class User
  attr_accessor :fname, :lname

  def self.find_by_id(id) 
    users = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT 
        * 
      FROM 
        users 
      WHERE 
        id = ? 
    SQL

    users.map { |user| User.new(user) }
  end

  def self.find_by_name(fname, lname)
    user = QuestionsDatabase.instance.execute(<<-SQL, fname, lname)
      SELECT 
        * 
      FROM 
        users
      WHERE 
        fname = ? AND lname = ? 
    SQL

    User.new(user.first)
  end

  def initialize(options)
    @fname = options['fname']
    @lname = options['lname']
  end

end