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

  def initialize(options)
    @fname = options['fname']
    @lname = options['lname']
  end

end