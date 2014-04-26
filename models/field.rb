class Field < Sequel::Model
  one_to_many :questions
  many_to_many :userabilities, :class => :User, :left_key => :field_id, :right_key => :user_id, :join_table => :abilities_users
  many_to_many :userinterests, :class => :User, :left_key => :field_id, :right_key => :user_id, :join_table => :interests_users
end

