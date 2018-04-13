language = Language.create(name: 'English', native: true, learn: false)
Location.create(locale: 'Stockholm', user_id: 4)

user = User.create(email: 'fake@fak.com', password: 'password',
            name: 'Mr.Miyagi', id: 4, gender: 'Male', age: 19)

user.languages << language
user.save
