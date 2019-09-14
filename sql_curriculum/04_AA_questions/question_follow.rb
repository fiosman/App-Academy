require_relative 'questions_database'
require_relative 'user'
require_relative 'question'

class QuestionFollow
  attr_accessor :user_id, :question_id

  def self.find_by_id(id)
    question_follows = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT 
        * 
      FROM 
        question_follows
      WHERE 
        id = ? 
    SQL

    question_follows.map { |question_follow| QuestionFollow.new(question_follow) }
  end

  def self.followers_for_question_id(question_id)
    users = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT 
        fname, lname
      FROM 
        question_follows
      JOIN 
        users ON users.id = question_follows.user_id
      JOIN 
        questions ON questions.id = question_follows.question_id
      WHERE 
        question_id = ?
    SQL

    users.map { |user| User.new(user) }
  end

  def self.followed_questions_for_user_id(user_id)
    #RETURNS QUESTIONS FOLLOWED BY A USER
    questions = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT 
        * 
      FROM 
        questions
      JOIN 
        question_follows ON question_follows.question_id = questions.id
      WHERE 
        question_follows.user_id = ?
     SQL

     questions.map { |question| Question.new(question) }
  end

  def self.most_followed_questions(n)
    questions = QuestionsDatabase.instance.execute(<<-SQL, n)
      SELECT 
        * 
      FROM 
        questions
      JOIN 
        question_follows ON question_follows.question_id = questions.id
      GROUP BY 
        question_follows.question_id
      ORDER BY 
        COUNT(question_follows.user_id) DESC
      LIMIT ? 
    SQL

    questions.map { |question| Question.new(question) }
  end

  def initialize(options)
    @id = options['id']
    @user_id = options['user_id']
    @question_id = options['question_id']
  end

end