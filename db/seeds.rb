# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'Cleaning database...'
Book.destroy_all
User.destroy_all
Category.destroy_all
Review.destroy_all
Domain.destroy_all
Course.destroy_all
Registration.destroy_all
ClassNote.destroy_all

puts 'Creating awesome categories...'


Category.create!({
  name: "front-end"
})
Category.create!({
  name: "back-end"
})
Category.create!({
  name: "fullstack"
})
Category.create!({
  name: "network"
})
Category.create!({
  name: "machine-learning"
})
Category.create!({
  name: "hardware"
})
Category.create!({
  name: "Articial-Intelligence"
})

categories = Category.all

puts "creating some usefull users..."

user_1 = User.new( {
  username: "Jery",
  email: "Jerry.slang@hotmail.com",
  password: '123456',
  password_confirmation: '123456'
})
# user_1.remote_avatar_url = "https://chartwellspeakers.b-cdn.net/wp-content/uploads/2017/10/Kahneman-2.jpg",
user_1.save!


user_2 = User.new( {
  username: "sherry",
  email: "sherry.stan@hotmail.com",
  password: '123456',
  password_confirmation: '123456'
})
# user_2.remote_avatar_url = "https://chartwellspeakers.b-cdn.net/wp-content/uploads/2017/10/Kahneman-2.jpg",
user_2.save!

user_3 = User.new( {
  username: "ricer",
  email: "ricer.lo@outlook.com",
  password: '123456',
  password_confirmation: '123456'
})
# user_3.remote_avatar_url = "https://chartwellspeakers.b-cdn.net/wp-content/uploads/2017/10/Kahneman-2.jpg",
user_3.save!

user_4 = User.new( {
  username: "jug",
  email: "jug.zar@oneup.com",
  password: '123456',
  password_confirmation: '123456'
})
# user_4.remote_avatar_url = "https://chartwellspeakers.b-cdn.net/wp-content/uploads/2017/10/Kahneman-2.jpg",
user_4.save!

user_5 = User.new( {
  username: "gola",
  email: "gola.bolo@gmail.com",
  password: '123456',
  password_confirmation: '123456'
})
# user_5.remote_avatar_url = "https://chartwellspeakers.b-cdn.net/wp-content/uploads/2017/10/Kahneman-2.jpg",
user_5.save!

user_6 = User.new( {
  username: "istvanlaz",
  email: "istvanlaz@gmail.com",
  password: '123456',
  password_confirmation: '123456',
  admin: true
})
# user_6.remote_avatar_url = "https://chartwellspeakers.b-cdn.net/wp-content/uploads/2017/10/Kahneman-2.jpg",
user_6.save!

user_7 = User.new( {
  username: "haralddou",
  email: "haralddou@hotmail.com",
  password: '123456',
  password_confirmation: '123456',
  admin: true
})
# user_7.remote_avatar_url = "https://chartwellspeakers.b-cdn.net/wp-content/uploads/2017/10/Kahneman-2.jpg",
user_7.save!

user_8 = User.new( {
  username: "gauthiey",
  email: "gauthiey07@gmail.com",
  password: '123456',
  password_confirmation: '123456',
  admin: true
})
# user_8.remote_avatar_url = "https://chartwellspeakers.b-cdn.net/wp-content/uploads/2017/10/Kahneman-2.jpg",
user_8.save!

# users = User.all

puts 'Creating awesome books...'

path = File.join(__dir__, 'seed_pdf.pdf')

book0 = Book.new({
  category_id: categories.sample,
  title: "Machine Learning with python cookbook",
  publishing_year: 2018,
  author: "Chris Albon",
  user_id: user_6.id
})
book0.remote_image_url = "https://images-na.ssl-images-amazon.com/images/I/51TcoYciN6L._SX379_BO1,204,203,200_.jpg"
book0.resume.attach(io: File.open(path), filename: 'seed_pdf.pdf')
book0.save!

book1 = Book.new({
  category_id: categories.sample,
  title: "Programming Pearls 2nd edition",
  publishing_year: 2000,
  author: "Jon Bentley",
  user_id: user_6.id
})
book1.remote_image_url = 'https://images-na.ssl-images-amazon.com/images/I/5182nSkamwL._SX367_BO1,204,203,200_.jpg'
book1.resume.attach(io: File.open(path), filename: 'seed_pdf.pdf')
book1.save!

book2 = Book.new({
  category_id: categories.sample,
  title: "More programming pearls",
  publishing_year: 1988,
  author: "Jon Bentley",
  user_id: user_6.id

})
book2.remote_image_url = 'https://images-na.ssl-images-amazon.com/images/I/51OLe7bvBWL._SX336_BO1,204,203,200_.jpg'
book2.resume.attach(io: File.open(path), filename: 'seed_pdf.pdf')
book2.save!

book3 = Book.new({
  category_id: categories.sample,
  title: "Eloquent Javascript 1st edition",
  publishing_year: 2011,
  author: "Marijn Haver",
  user_id: user_6.id

})
book3.remote_image_url = "https://images-na.ssl-images-amazon.com/images/I/515jiKSErDL._SX376_BO1,204,203,200_.jpg"
book3.resume.attach(io: File.open(path), filename: 'seed_pdf.pdf')
book3.save!

book4 = Book.new({
  category_id: categories.sample,
  title: "Eloquent Javascript 2nd edition",
  publishing_year: 2014,
  author: "Marijn Haver",
  user_id: user_6.id

})
book4.remote_image_url = "https://images-na.ssl-images-amazon.com/images/I/515jiKSErDL._SX376_BO1,204,203,200_.jpg"
book4.resume.attach(io: File.open(path), filename: 'seed_pdf.pdf')
book4.save!

book5 = Book.new({
  category_id: categories.sample,
  title: "Eloquent Javascript 3rd edition",
  publishing_year: 2018,
  author: "Marijn Haver",
  user_id: user_6.id

})
book5.remote_image_url = "https://images-na.ssl-images-amazon.com/images/I/51-5ZXYtcML._SX377_BO1,204,203,200_.jpg"
book5.resume.attach(io: File.open(path), filename: 'seed_pdf.pdf')
book5.save!

book6 = Book.new({
  category_id: categories.sample,
  title: "JavaScript and JQuery: Interactive Front–End Web Development",
  publishing_year: 2014,
  author: "Jon Duckket",
  user_id: user_6.id

})
book6.remote_image_url = "https://images-na.ssl-images-amazon.com/images/I/41y31M-zcgL._SX400_BO1,204,203,200_.jpg"
book6.resume.attach(io: File.open(path), filename: 'seed_pdf.pdf')
book6.save!

book7 = Book.new({
  category_id: categories.sample,
  title: "Modern API Design with ASP.NET Core 2: Building Cross-Platform Back-End Systems",
  publishing_year: 2018,
  author: "Fany Reynder",
  user_id: user_6.id

})
book7.remote_image_url = "https://images-na.ssl-images-amazon.com/images/I/41Nd3IVeklL._SX348_BO1,204,203,200_.jpg"
book7.resume.attach(io: File.open(path), filename: 'seed_pdf.pdf')
book7.save!

book8 = Book.new({
  category_id: categories.sample,
  title: "Fullstack React Native: Create beautiful mobile apps with JavaScript and React Native",
  publishing_year: 2019,
  author: "Devin Abbott",
  user_id: user_6.id

})
book8.remote_image_url = "https://images-na.ssl-images-amazon.com/images/I/51071Pm5H7L._SX404_BO1,204,203,200_.jpg"
book8.resume.attach(io: File.open(path), filename: 'seed_pdf.pdf')
book8.save!

book9 = Book.new({
  category_id: categories.sample,
  title: "Computer Networking: A Top-Down Approach, 7th Edition",
  publishing_year: 2016,
  author: "Kurose Ross",
  user_id: user_6.id
})

book9.remote_image_url = "https://images-na.ssl-images-amazon.com/images/I/51xp1%2BoDRML._SX402_BO1,204,203,200_.jpg"
book9.resume.attach(io: File.open(path), filename: 'seed_pdf.pdf')
book9.save!

book10 = Book.new({
  category_id: categories.sample,
  title: "Make: Arduino Bots and Gadgets: Six Embedded Projects with Open Source Hardware and Software",
  publishing_year: 2011,
  author: "Tero Kervine",
  user_id: user_6.id
})

book10.remote_image_url = "https://images-eu.ssl-images-amazon.com/images/I/51c5QnQTEZL.jpg"
book10.resume.attach(io: File.open(path), filename: 'seed_pdf.pdf')
book10.save!

book11 = Book.new({
  category_id: categories.sample,
  title: "AI Superpowers: China, Silicon Valley, and the New World Order",
  publishing_year: 2018,
  author: "Kai-fu Lee",
  user_id: user_6.id
})

book11.remote_image_url = "https://s.s-bol.com/imgbase0/imagebase3/large/FC/6/7/7/9/9200000091699776.jpg"
book11.resume.attach(io: File.open(path), filename: 'seed_pdf.pdf')
book11.save!

book12 = Book.new({
  category_id: categories.sample,
  title: "Introduction to the Math of Neural Networks",
  publishing_year: 2012,
  author: "Jeff Heaton",
  user_id: user_6.id

})
book12.remote_image_url = "https://images-eu.ssl-images-amazon.com/images/I/51o%2B7BRJ45L.jpg"
book12.resume.attach(io: File.open(path), filename: 'seed_pdf.pdf')
book12.save!

book13 = Book.new({
  category_id: categories.sample,
  title: "Artificial Intelligence for Humans, Volume 3: Deep Learning and Neural Networks ",
  publishing_year: 2015,
  author: "Jeff Heaton",
  user_id: user_6.id
})
book13.remote_image_url = "https://images-na.ssl-images-amazon.com/images/I/51cAXV2e6LL._SX402_BO1,204,203,200_.jpg"
book13.resume.attach(io: File.open(path), filename: 'seed_pdf.pdf')
book13.resume.attach(io: File.open(path), filename: 'seed_pdf.pdf')
book13.save!

book14 = Book.new({
  category_id: categories.sample,
  title: "The Illustrated Network: How TCP/IP Works in a Modern Network",
  publishing_year: 2017,
  author: "Walter Goral",
  user_id: user_6.id
})
book14.remote_image_url = "https://images-na.ssl-images-amazon.com/images/I/51-M9b-plTL._SX404_BO1,204,203,200_.jpg"
book14.resume.attach(io: File.open(path), filename: 'seed_pdf.pdf')
book14.save!

book15 = Book.new({
  category_id: categories.sample,
  title: "Back-end Perfomance ",
  publishing_year: 2017,
  author: "Bruno Skvorc",
  user_id: user_6.id
})
book15.remote_image_url = "https://images-eu.ssl-images-amazon.com/images/I/416QmUkdrWL.jpg"
book15.resume.attach(io: File.open(path), filename: 'seed_pdf.pdf')
book15.save!
# books = Book.all

puts 'Creating awesome domains...'

domain_1 = Domain.create!({
  name: "Business"
})
domain_1.remote_image_url = File.join(__dir__, 'topics/topic_business.jpg')
domain_1.save!

domain_2 = Domain.create!({
  name: "Law"
})
domain_2.remote_image_url = File.join(__dir__, 'topics/topic_law.jpg')
domain_2.save!

domain_3 = Domain.create!({
  name: "Coding"
})
domain_3.remote_image_url = File.join(__dir__, 'topics/topic_coding.jpg')
domain_3.save!

domain_4 = Domain.create!({
  name: "Engineering"
})
domain_4.remote_image_url = File.join(__dir__, 'topics/topic_engineering.jpg')
domain_4.save!

domain_5 = Domain.create!({
  name: "Architecture"
})
domain_5.remote_image_url = File.join(__dir__, 'topics/topic_architecture.jpg')
domain_5.save!

domain_6 = Domain.create!({
  name: "Physics"
})
domain_6.remote_image_url = File.join(__dir__, 'topics/topic_sciences.jpg')
domain_6.save!

# domains = Domain.all



puts 'Creating awesome courses...'

course_1 = Course.new({
  name: "SQL",
  domain: domain_3
})
course_1.remote_image_url = File.join(__dir__, 'courses/note_sql.jpg')
course_1.save!

course_2 = Course.new({
  name: "Back-end Basics",
  domain: domain_3
})
course_2.remote_image_url = File.join(__dir__, 'courses/note_backend.jpg')
course_2.save!

course_3 = Course.new({
  name: "Front-end Basics",
  domain: domain_3
})
course_3.remote_image_url = File.join(__dir__, 'courses/note_front_end1.jpg')
course_3.save!

course_4 = Course.new({
  name: "Front-end Advanced",
  domain: domain_3
})
course_4.remote_image_url = File.join(__dir__, 'courses/note_front2.jpg')
course_4.save!

course_5 = Course.new({
  name: "JavaScript Advanced",
  domain: domain_3
})
course_5.remote_image_url = File.join(__dir__, 'courses/note_js.jpg')
course_5.save!

course_6 = Course.new({
  name: "Python for Pros",
  domain: domain_3
})
course_6.remote_image_url = File.join(__dir__, 'courses/note_python.jpg')
course_6.save!

# courses = Course.all



puts 'Creating awesome registrations...'

Registration.create!({
  course: course_1,
  user_id: user_3.id
})

Registration.create!({
  course: course_1,
  user_id: user_3.id
})

Registration.create!({
  course: course_1,
  user_id: user_3.id
})

Registration.create!({
  course: course_1,
  user_id: user_3.id
})

Registration.create!({
  course: course_1,
  user_id: user_3.id
})

Registration.create!({
  course: course_1,
  user_id: user_3.id
})

# registrations = Registration.all



puts 'Creating awesome Class Notes...'

path_notes = File.join(__dir__, 'notes.pdf')

classnote0 = ClassNote.new({
  user_id: user_2.id,
  course: course_1,
  title: "SQL Basics",
  author: "Me, Myself and Irene",
  click_counter: 4
})
classnote0.content.attach(io: File.open(path_notes), filename: 'notes.pdf')
classnote0.remote_image_url = File.join(__dir__, 'courses/note_sql.jpg')
classnote0.save!


classnote1 = ClassNote.new({
  user_id: user_2.id,
  course: course_2,
  title: "SQL Median",
  author: "Me, Myself and Irene",
  click_counter: 4
})
classnote1.content.attach(io: File.open(path_notes), filename: 'notes.pdf')
classnote1.remote_image_url = File.join(__dir__, 'courses/notes_dat1.jpg')
classnote1.save!

classnote2 = ClassNote.new({
  user_id: user_2.id,
  course: course_3,
  title: "Building Awesome DBs",
  author: "Me, Myself and Irene",
  click_counter: 4
})
classnote2.content.attach(io: File.open(path_notes), filename: 'notes.pdf')

classnote2.remote_image_url = File.join(__dir__, 'courses/notes_dat2.jpg')
classnote2.save!

classnote3 = ClassNote.new({
  user_id: user_2.id,
  course: course_4,
  title: "SQL for Pros!!",
  author: "Me, Myself and Irene",
  click_counter: 4
})

classnote3.content.attach(io: File.open(path_notes), filename: 'notes.pdf')

classnote3.remote_image_url = File.join(__dir__, 'courses/notes_dat3.jpg')
classnote3.save!

classnote4 = ClassNote.new({
  user_id: user_2.id,
  course: course_5,
  title: "Front is not made for bitches",
  author: "Me, Myself and Irene",
  click_counter: 4
})
classnote4.content.attach(io: File.open(path_notes), filename: 'notes.pdf')

classnote4.remote_image_url = File.join(__dir__, 'courses/note_front2.jpg')
classnote4.save!

classnote5 = ClassNote.new({
  user_id: user_2.id,
  course: course_6,
  title: "I'm the king of them bananas",
  author: "Me, Myself and Irene",
  click_counter: 4
})
classnote5.content.attach(io: File.open(path_notes), filename: 'notes.pdf')

classnote5.remote_image_url = File.join(__dir__, 'courses/note_js.jpg')
classnote5.save!

# class_notes = ClassNote.all



puts 'Finished!'
