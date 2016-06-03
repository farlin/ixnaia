# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#

# Added some students..
# making sure the seed data always retain the same set of Ids
Student.where(id: 1..5).destroy_all

students = Student.create([
    { id: 1, name: 'Gi'       }, 
    { id: 2, name: 'Kwame'    }, 
    { id: 3, name: 'Linka'    }, 
    { id: 4, name: 'Ma-Ti'    }, 
    { id: 5, name: 'Wheeler'  }
])

#
# We are supposed to have 100 lessons
#
Lesson.where(id: 1..100).destroy_all
LessonPart.where(id: 1..300).destroy_all

xdx = 1
100.times do |i|
  idx = i+1   # making sure we start our numbers at 1
  lesson = Lesson.create(id: idx, title: "Lesson ##{idx}", content: "In this particular lesson #{idx}, student will learn all about..")
  
  # each lesson will have 3 parts
  #
  3.times do |x|
      seq = x + 1
      LessonPart.create(id: xdx, name: "Lesson ##{idx} Part ##{seq}", lesson: lesson, sequence: seq)
      
      xdx = xdx + 1 # incrementing the index for lesson parts
  end
end