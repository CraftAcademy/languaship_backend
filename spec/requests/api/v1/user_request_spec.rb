require 'rails_helper'

RSpec.describe Api::V1::UserController, type: :request do
  let!(:user) {create(:user)}
  let(:object) {JSON.parse(response.body)}
  let(:credentials) {user.create_new_auth_token}
  let(:headers) {{HTTP_ACCEPT: 'application/json'}.merge!(credentials)}

  describe 'GET /api/v1/user' do
    describe 'oneUser' do
      it 'Should return one user' do
        language = Language.new(name: 'French', native: true, learn: false)
        location = Location.new(locale: 'Jamaica')
        user = create(:user)
        user.location = location
        user.languages << language
        user.save
        get "/api/v1/user/#{user.id}", headers: headers

        expected_response = eval(file_fixture('user.txt').read)
        expect(object).to eq expected_response
      end
    end

    describe 'multiple Users' do
      context 'create two users' do
        before do
          2.times do
            user = create(:user, image: "http://cdn2.ubergizmo.com/wp-content/uploads/2016/02/homer-simpson.jpeg")
            user.languages.create(name: 'Dutch', native: false, learn: true)
            location = create(:location, locale: 'France', user: user)
            user.save
          end
        end

        let(:users) {User.all}

        it 'Should return all users' do
          get '/api/v1/user', headers: headers
          expected_response = eval(file_fixture('users.txt').read)
          expect(object).to eq expected_response
        end
      end
    end

    describe 'updates user' do
      let!(:user) {create(:user)}
      let(:object) {JSON.parse(response.body)}
      let(:credentials) {user.create_new_auth_token}
      let(:headers) {{HTTP_ACCEPT: 'application/json'}.merge!(credentials)}



      it 'POST /api/v1/user' do
        Language.create(name: 'Swedish', learn: true, native: false)
        Language.create(name: 'Swedish', learn: false, native: true)
        Language.create(name: 'English', learn: false, native: true)
        Language.create(name: 'English', learn: true, native: false)

        post "/api/v1/user", params: {
            user_profile: {
                name: 'Aiden',
                age: 38,
                gender: 'Male',
                learnLanguage: "Swedish",
                nativeLanguage: 'English',
                location: 'Gothenburg'
            }
        }, headers: headers

        location = Location.find_by_locale('Gothenburg')
        user = User.last
        userNative = user.languages.detect {|lan| lan.native == true}
        userlearn = user.languages.detect {|lan| lan.learn == true}

        expect(user.age).to eq 38
        expect(user.gender).to eq 'Male'
        expect(user.name).to eq 'Aiden'
        expect(userNative.name).to eq 'English'
        expect(userlearn.name).to eq 'Swedish'
        expect(user.location).to eq location
        expect(user.age).to eq 38
      end
    end
  end
end
