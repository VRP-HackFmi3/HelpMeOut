class User < Sequel::Model
  one_to_many :questions
  one_to_many :answers
  many_to_one :rank
  many_to_many :abilities , :class => :Field , :left_key => :user_id, :right_key => :field_id, :join_table => :abilities_users
  many_to_many :interests, :class => :Field, :left_key => :user_id, :right_key => :field_id, :join_table => :interests_users
end