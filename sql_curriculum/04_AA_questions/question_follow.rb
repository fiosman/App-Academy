require_relative 'questions_database'

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

  def initialize(options)
    @user_id = options['user_id']
    @question_id = options['question_id']
  end


end