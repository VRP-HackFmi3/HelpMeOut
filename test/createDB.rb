require 'sequel'
DB = Sequel.sqlite('../database/development.db')

Dir['../{models}/*.rb'].each { |file| require file }


at1 = AnswerType.create(name:"YesNo",score:1)
at2 = AnswerType.create(name:"Critical",score:10)
at3 = AnswerType.create(name:"Video",score:6)

r1 = Rank.create(score_min:0,name:"Noob")
r2 = Rank.create(score_min:100,name:"Aprentice")
r3 = Rank.create(score_min:250,name:"Wizard")
r4 = Rank.create(score_min:1000,name:"Guru")
r5 = Rank.create(score_min:9001,name:"Cheater")

f1 = Field.create(name:"Math")
f2 = Field.create(name:"Analysis")
f3 = Field.create(name:"Magic")
f4 = Field.create(name:"Car Drifting")
f5 = Field.create(name:"Sports")
f6 = Field.create(name:"History")
f7 = Field.create(name:"Languages")
f8 = Field.create(name:"Birds")
f9 = Field.create(name:"Music")
f10 = Field.create(name:"Art")
f11 = Field.create(name:"Other")


u1 = User.create(username:"Drago",rank:r1,password:"Parola",first_name:"Drago",last_name:"Chaq",email:"mail@mail.com",xp:0)
u2 = User.create(username:"Ivan",rank:r1,password:"Parola",first_name:"Dragon",last_name:"Bush",email:"124mail@mail.com",xp:12)
u3 = User.create(username:"Negur",rank:r2,password:"Parola",first_name:"Orel",last_name:"Petrov",email:"mai4124l@mail.com",xp:160)
u4 = User.create(username:"Pacha",rank:r4,password:"Parola",first_name:"Kozi",last_name:"Krak",email:"maittl@mabil.com",xp:1024)


u1.add_interest(f1)
u1.add_ability(f4)
u1.add_ability(f3)

u2.add_interest(f2)
u2.add_ability(f1)

u3.add_ability(f2)
u3.add_ability(f3)

u4.add_interest(f3)
u4.add_ability(f4)
u4.add_ability(f1)

q1 = Question.create(field:f1,user:u1,answer_type:at1,title:"Kontrolno po matematika",text:"Imam kontrolno po matematika , 1 + 1 = 2 ?",status:0,time_created:Time.now,time_expires:Time.now + 3660)
q2 = Question.create(field:f2,user:u2,answer_type:at2,title:"IZPIT PO GEOMETRIQ", text:"Sled 2h imam izpit po geometriq, no ne znaq kakvo e minimalna transferzala. HELP!!", status:0, time_created:Time.now, time_expires:Time.now + 120)
q3 = Question.create(field:f2,user:u3,answer_type:at3,title:"Ne razbiram nishto ot veroqtnosti i statistika", text:"Za 3ta godina me kusat po ViS, nqkoi moje li da mi obqsni zadachite", status:0, time_created:Time.now, time_expires:Time.now+ 1000000)
