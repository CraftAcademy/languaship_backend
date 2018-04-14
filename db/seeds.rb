Location.destroy_all
Language.destroy_all
User.destroy_all

# Languages
languages = [['SWEDISH', true, false], ['FRENCH', true, false],
             ['ITALIAN', true, false], ['GERMAN', true, false],
             ['ENGLISH', true, false], ['SPANISH', true, false],
             ['FINNISH', true, false], ['SWEDISH', false, true],
             ['FRENCH', false, true], ['ITALIAN', false, true],
              ['GERMAN', false, true], ['ENGLISH', false, true],
              ['SPANISH', false, true], ['FINNISH', false, true]]

languages.each do |lan|
  Language.create(name: lan[0], native: lan[1], learn: lan[2])
end
# Locations

locations = %w[Springfield Paris Amsterdam]
# User
name = ['Homer Simpson', 'Marge Simpson', 'Philip J. Fry']
email = ['Homer@simpson.com', 'Marge@simpson.com', 'Philip@fry.com']
age = [39, 36, 25]
gender = %w[Male Female Male]
images = ['https://cdn1.thr.com/sites/default/files/imagecache/scale_crop_768_433/2016/02/simp2006_homerarmscrossed_f_hires2_-_h_2016.jpg',
          'https://upload.wikimedia.org/wikipedia/en/0/0b/Marge_Simpson.png',
          'https://theinfosphere.org/images/0/0d/Fry_promo_2.jpg']

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
  user.languages << Language.find_by(id: Language.first.id + index)
  user.languages << Language.find_by(id: Language.first.id + index + 8)
  user.save
end
