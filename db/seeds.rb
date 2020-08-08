#here is where we create seed data to test associations

#create users
jessica = User.create(name: "Jessica", email: "jessica@jessica.com", password: "password")
sydney = User.create(name: "Sydney", email: "sydney@sydney.com", password: "password")

#create health entry

HealthEntry.create(content: "Today is August 7th", user_id: jessica.id)
HealthEntry.create(content: "I feel so much better", user_id: sydney.id)