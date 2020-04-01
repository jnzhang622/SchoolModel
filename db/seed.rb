s1 = School.create!(name: "PS131")

j1 = Janitor.create!(name: "Bob", school: s1)
j2 = Janitor.create!(name: "George", school: s1)

m1 = Mop.create!(brand: "KeepClean")
m2 = Mop.create!(brand: "KeepClean")
m3 = Mop.create!(brand: "KeepClean")

jm1 = Janitormop.create!(janitor:j1, mop:m1)
jm2 = Janitormop.create!(janitor:j2, mop:m2)

f1 = Floor.create!(flr: "1st", shininess: 8)
f2 = Floor.create!(flr: "2nd", shininess: 6)
f3 = Floor.create!(flr: "3rd", shininess: 10)
f4 = Floor.create!(flr: "4th", shininess: 3)

mf1 = Mopfloor.create!(mop: m1, floor: f1)
mf2 = Mopfloor.create!(mop: m1, floor: f2)
mf3 = Mopfloor.create!(mop: m2, floor: f3)
mf4 = Mopfloor.create!(mop: m2, floor: f4)

t1 = Teacher.create!(name: "Ms.Mcgonagall", school: s1)
t2 = Teacher.create!(name: "Mr.Lupin", school: s1)

sd1 = Student.create!(name: "Jim", school: s1)
sd2 = Student.create!(name: "Emily", school: s1)
sd3 = Student.create!(name: "Zack", school: s1)
sd4 = Student.create!(name: "Ashley", school: s1)

sj1 = Subject.create!(name: "English")
sj2 = Subject.create!(name: "Math")
sj3 = Subject.create!(name: "Science")
sj4 = Subject.create!(name: "Social Studies")

ss1 = Studentsubject.create!(student: sd1, subject: sj1)
ss2 = Studentsubject.create!(student: sd1, subject: sj2)
ss3 = Studentsubject.create!(student: sd1, subject: sj3)
ss4 = Studentsubject.create!(student: sd1, subject: sj4)
ss5 = Studentsubject.create!(student: sd2, subject: sj1)
ss6 = Studentsubject.create!(student: sd2, subject: sj2)
ss7 = Studentsubject.create!(student: sd2, subject: sj3)
ss8 = Studentsubject.create!(student: sd2, subject: sj4)
ss9 = Studentsubject.create!(student: sd3, subject: sj1)
ss10 = Studentsubject.create!(student: sd3, subject: sj2)
ss11 = Studentsubject.create!(student: sd3, subject: sj3)
ss12 = Studentsubject.create!(student: sd3, subject: sj4)
ss13 = Studentsubject.create!(student: sd4, subject: sj1)
ss14 = Studentsubject.create!(student: sd4, subject: sj2)
ss15 = Studentsubject.create!(student: sd4, subject: sj3)
ss16 = Studentsubject.create!(student: sd4, subject: sj4)
