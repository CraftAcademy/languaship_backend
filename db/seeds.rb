language = Language.create(name: 'English', native: true, learn: false)
Location.create(locale: 'Stockholm', user_id: 4)

user = User.create(email: 'fake@fak.com', password: 'password',
            name: 'Mr.Miyagi', id: 4, gender: 'Male', age: 19)

user.languages << language
user.save

#Languages
[["Swedish", false, true ], ["French", false, true], ["Dutch", true, false]]

#Locations
["Springfield", "Paris", "Amsterdam"]

#User
["Homer Simpson", "Marge Simpson", "Philip J. Fry"]
["Homer@simpson.com", "Marge@simpson.com", "Philip@fry.com"]
[39, 36, 25]
["Male", "Female", "Male"]
[https://cdn1.thr.com/sites/default/files/imagecache/scale_crop_768_433/2016/02/simp2006_homerarmscrossed_f_hires2_-_h_2016.jpg,
 https://upload.wikimedia.org/wikipedia/en/0/0b/Marge_Simpson.png,
 https://theinfosphere.org/images/0/0d/Fry_promo_2.jpg]
