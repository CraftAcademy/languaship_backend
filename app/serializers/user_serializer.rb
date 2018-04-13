class UserSerializer < ActiveModel::Serializer
  attributes :id, :languages, :location, :name, :email, :age, :gender

  def languages
    object.languages.map do |lan|
      LanguageSerializer.new(lan).as_json
    end
  end

  def location
    if object.location
      LocationSerializer.new(object.location).as_json
    end
  end
end
