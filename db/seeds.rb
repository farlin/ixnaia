# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#


students = Student.create([
    { 
        name: 'Gi' 
    }, 
    { 
        name: 'Kwame' 
    }, 
    { 
        name: 'Linka' 
    }, 
    { 
        name: 'Ma-Ti' 
    }, 
    { 
        name: 'Wheeler' 
    }
])

# we are supposed to have 100 lessons
#
100.times do |i|
  i_ref = i+1   # because the loop starts at zero
  lesson = Lesson.create(title: "Lesson ##{i_ref}", content: "In this particular lesson #{i_ref}, student will learn all about..")
  
  # each lesson will have 3 parts
  #
  3.times do |x|
      x_ref = x + 1
      LessonPart.create(name: "Lesson ##{i_ref} Part ##{x_ref}", lesson: lesson, sequence: x_ref)
  end
end