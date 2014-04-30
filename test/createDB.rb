require 'sequel'
require_relative '../helpers/autentication_helpers'

include HelpMeOut::AuthenticationHelpers

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
f12 = Field.create(name:"IT")
f13 = Field.create(name:"Social Skills")

salt = generate_salt
u1 = User.create(username:"Drago",salt:salt,rank:r1,password:(hash_password "parola",salt),first_name:"Dragan",last_name:"Petrov",email:"mail@mail.com",xp:0)
salt = generate_salt
u2 = User.create(username:"Hary",salt:salt,rank:r1,password:(hash_password "parola",salt),first_name:"Ivelin",last_name:"Nikolov",email:"124mail@mail.com",xp:12)
salt = generate_salt
u3 = User.create(username:"Ivan",salt:salt,rank:r2,password:(hash_password "parola",salt),first_name:"Boris",last_name:"Jivkov",email:"mai4124l@mail.com",xp:160)
salt = generate_salt
u4 = User.create(username:"Yani",salt:salt,rank:r4,password:(hash_password "parola",salt),first_name:"Yana",last_name:"Ivanova",email:"maittl@mabil.com",xp:1024)
salt = generate_salt
u5 = User.create(username:"user",salt:salt, rank:r3, password:(hash_password "parola",salt), first_name:"Pesho", last_name:"Peshev",email: "pesho@example.bg", xp:1000)

u1.add_interest(f1)
u1.add_ability(f4)
u1.add_ability(f3)

u2.add_interest(f13)
u2.add_ability(f1)
u2.add_ability(f3)
u2.add_interest(f4)
u2.add_ability(f5)
u2.add_interest(f6)
u2.add_ability(f7)
u2.add_interest(f8)
u2.add_ability(f9)

u3.add_ability(f13)
u3.add_ability(f3)
u3.add_interest(f1)
u3.add_interest(f2)


u4.add_interest(f3)
u4.add_ability(f4)
u4.add_ability(f1)

u5.add_interest(f1)
u5.add_interest(f2)
u5.add_ability(f3)
u5.add_interest(f4)
u5.add_ability(f5)
u5.add_interest(f6)
u5.add_ability(f7)
u5.add_interest(f8)
u5.add_ability(f9)

q1 = Question.create(field:f1,user:u1,answer_type:at1,type:1,title:"Math test",text:"Can you divide by zero?",status:0,time_created:Time.now,time_expires:Time.now + 10*3600)
q2 = Question.create(field:f2,user:u2,answer_type:at2,title:"Geometry exam", text:"What is minimal transversal?", status:0, time_created:Time.now, time_expires:Time.now + 6*3600)
q3 = Question.create(field:f2,user:u3,answer_type:at3,title:"Probability & Statistics", text:"Can someone explain what probability is?", status:0, time_created:Time.now, time_expires:Time.now + 12*3600)
q4 = Question.create(field:f5, user:u2, answer_type:at2, title:"Fitnes", text: "Can someone recommend some exercises?", status: 0, time_created: Time.now, time_expires:Time.now + 5*3600)
q5 = Question.create(field:f6, user:u4,answer_type:at2,title:"The Battle of Gettysburg",text:"When was it?", status:0, time_created:Time.now, time_expires:Time.now + 8*3600)
q6 = Question.create(field:f7, user:u3,answer_type:at2, title:"Word meaning",text:"What does Schornsteinfeger mean?",status:0,time_created:Time.now, time_expires:Time.now + 9*3600)
q7 = Question.create(field:f12, user:u3,answer_type:at1,type:1, title:"Programming",text:"Is C++ the best programming language to learn at first?",status:0,time_created:Time.now, time_expires:Time.now + 9*3500)
q8 = Question.create(field:f9, user:u1,answer_type:at2, title:"Music",text:"What does C# mean?",status:0,time_created:Time.now, time_expires:Time.now + 5*3600)
q9 = Question.create(field:f8, user:u1,answer_type:at2, title:"Fastest bird",text:"Which bird flies the fastest?",status:0,time_created:Time.now, time_expires:Time.now + 8*3500)
q10 = Question.create(field:f5, user:u5,answer_type:at1,type:1, title:"Should I drink water", text:"Should I drink water after I have jogged ?",status:0, time_created:Time.now, time_expires: Time.now + 48*60*60)
q11 = Question.create(field:f2, user:u5, answer_type:at3, title:"How do I solve integrals?", text:"I have test in Analysis in 2 days. Can someone explain me how to solve integrals? I've been very busy and skipped the classes so i have no clue. Please help !", status:0, time_created: Time.now, time_expires: Time.now + 10*60*60)
q12 = Question.create(field:f1, user:u5, answer_type:at3, title:"I can't find this probability!", text:"Toss a coin 100 times, how many Heads will come up?Probability says that heads have a ½ chance, so we would expect 50 Heads.But when you actually try it out you might get 48 heads, or 55 heads ... or anything really, but in most cases it will be a number near 50.", status:0, time_created:Time.now, time_expires: Time.now + 24*60*60)
q13 = Question.create(field:f7, user: u2, answer_type: at3, title:"Learn French", text: " Hi, I really want to learn French and I'm looking for a recommendation for a teacher or someone here willing to help. Thanks guys !",status:0, time_created:Time.now, time_expires:Time.now + 7*60*60)
q14 = Question.create(field:f11, user: u3, answer_type: at1,type:1, title:"Is milk healthy ?", text:"I've read that milk is not healthy and one should not drink milk. Is this true ?", status:0, time_created: Time.now, time_expires: Time.now + 60*60*60)
q15 = Question.create(field:f11, user: u3, answer_type: at3, title:"Help rebooting PC", text:"I can't reboot my PC. When I insert the disk it says that the harddisk is not recognized. Can someone help ?", status:0, time_created:Time.now, time_expires: Time.now + 10*60*60)
q16 = Question.create(field:f13, user: u2, answer_type: at2, title:"Help in German!!!", text:"How do you say 'Thank you for everything.' in German. Please someone help me fast.", status:0, time_created: Time.now, time_expires: Time.now + 4*60*60)

a1 = Answer.create(answer_type:at1, question:q1, user:u2, text:"No.", time_answered:Time.now)
a2 = Answer.create(answer_type:at2, question:q2, user:u1, text:"I don't know.", time_answered:Time.now)
a3 = Answer.create(answer_type:at3, question:q3, user:u4, text:"Probability is a measure of the likeliness that an event will occur.", time_answered:Time.now)
a4 = Answer.create(answer_type:at2, question:q4, user:u1, text:"It depends. Be more specific.", time_answered:Time.now)
a5 = Answer.create(answer_type:at2, question:q5, user:u4, text:"1863.", time_answered:Time.now)
a6 = Answer.create(answer_type:at2, question:q6, user:u1, text:"Chimney sweeper.", time_answered:Time.now)
a7 = Answer.create(answer_type:at1, question:q7, user:u2, text:"Yes.", time_answered:Time.now)
a8 = Answer.create(answer_type:at1, question:q8, user:u2, text:"C# (C-sharp) is a musical note lying a chromatic semitone above C and a diatonic semitone below D.", time_answered:Time.now)
a9 = Answer.create(answer_type:at2, question:q9, user:u4, text:"The peregrine falcon.", time_answered:Time.now)
a10 = Answer.create(answer_type: at2, question:q11, user:u1, text:"What kind of integrals do you want to solve ?", time_answered: Time.now)
a11 = Answer.create(answer_type: at2, question:q12, user:u3, text:"Isn't it 1245/11.", time_answered: Time.now)
a12 = Answer.create(answer_type: at2, question:q13, user:u4, text:"I have a really close friend of mine, who gives part time lessons. Call me on 0887345624 to arrange something.", time_answered: Time.now)
a13 = Answer.create(answer_type: at2, question:q14, user:u1, text:"YES!", time_answered: Time.now)
a14 = Answer.create(answer_type: at2, question:q15, user:u2, text:"I have CD's with the most used Windows and some Linux OS, we can arrange a date so you can give me the pc for some time.", time_answered: Time.now)
a15 = Answer.create(answer_type: at2, question:q16, user:u5, text:"Danke fuer alles, das du gemacht hast. or something like that.", time_answered: Time.now)