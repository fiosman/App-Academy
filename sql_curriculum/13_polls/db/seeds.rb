# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(username: 'Megan')
User.create!(username: 'Curtis')
User.create!(username: 'Jason')

Poll.create!(title: 'Elections 2020', user_id: 1)
Poll.create!(title: 'NBA Season 2019', user_id: 2)
Poll.create!(title: 'Trivia', user_id: 3)

#Question -> question, poll id

Question.create!(question: 'Who are the two most popular parties in Canada?', poll_id: 1)
Question.create!(question: 'What is the name of Canada\'s current prime minister?', poll_id: 1)
Question.create!(question: 'In what month does voting begin?', poll_id: 1)
Question.create!(question: 'Who is the best basketball player', poll_id: 2)
Question.create!(question: 'What team won the 2019 NBA finals?', poll_id: 2)
Question.create!(question: 'Which country has the largest population in the world?', poll_id: 3)
Question.create!(question: 'What is the name of the best coding bootcamp?', poll_id: 3)

AnswerChoice.create!(answer_choice: 'Conservatives and Liberals', question_id: 1)
AnswerChoice.create!(answer_choice: 'Justin Trudeau', question_id: 2)
AnswerChoice.create!(answer_choice: 'Donald Trump', question_id: 2)
AnswerChoice.create!(answer_choice: 'October', question_id: 3)
AnswerChoice.create!(answer_choice: 'August', question_id: 3)
AnswerChoice.create!(answer_choice: 'Anthony Davis', question_id: 4)
AnswerChoice.create!(answer_choice: 'Lebron James', question_id: 4)
AnswerChoice.create!(answer_choice: 'Stephen Curry', question_id: 4)
AnswerChoice.create!(answer_choice: 'Raptors', question_id: 5)
AnswerChoice.create!(answer_choice: 'Golden State', question_id: 5)
AnswerChoice.create!(answer_choice: 'India', question_id: 6)
AnswerChoice.create!(answer_choice: 'China', question_id: 6)
AnswerChoice.create!(answer_choice: 'America', question_id: 6)
AnswerChoice.create!(answer_choice: 'Hack Reactor', question_id: 7)
AnswerChoice.create!(answer_choice: 'App Academy', question_id:   7)

Response.create!(user_id: 1, answer_choice_id: 1) 
Response.create!(user_id: 2, answer_choice_id: 3)
Response.create!(user_id: 3, answer_choice_id: 7)
Response.create!(user_id: 3, answer_choice_id: 5)