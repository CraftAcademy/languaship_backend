# language = Language.create(name: 'English', native: true, learn: false)
# Location.create(locale: 'Stockholm', user_id: 4)
#
# user = User.create(email: 'fake@fak.com', password: 'password',
#                    name: 'Mr.Miyagi', id: 4, gender: 'Male', age: 19)
#
# user.languages << language
# user.save
#

  Location.destroy_all
  Language.destroy_all
  User.destroy_all

#Languages
native_languages = [["Swedish", false, true], ["French", false, true], ["Dutch", false, true]]
learn_languages = [["French", true, false], ["Dutch", true, false], ["Swedish", true, false]]

#Locations
locations = ["Springfield", "Paris", "Amsterdam"]

#User
name = ["Homer Simpson", "Marge Simpson", "Philip J. Fry"]
email = ["Homer@simpson.com", "Marge@simpson.com", "Philip@fry.com"]
age = [39, 36, 25]
gender = ["Male", "Female", "Male"]
images = ["https://cdn1.thr.com/sites/default/files/imagecache/scale_crop_768_433/2016/02/simp2006_homerarmscrossed_f_hires2_-_h_2016.jpg",
          "https://upload.wikimedia.org/wikipedia/en/0/0b/Marge_Simpson.png",
          "https://theinfosphere.org/images/0/0d/Fry_promo_2.jpg"]


3.times do |index|
  user = User.create(
      name: name[index],
      age: age[index],
      gender: gender[index],
      email: email[index],
      image: images[index],
      password: 'password'
  )
  Location.create(locale: locations[index], user: user)
  user.languages << Language.create(name: native_languages[index][0],
                                    native: native_languages[index][1],
                                    learn: native_languages[index][2])
  user.languages << Language.create(name: learn_languages[index][0],
                                    native: learn_languages[index][1],
                                    learn: learn_languages[index][2])
  user.save
end