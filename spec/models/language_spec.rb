require 'rails_helper'

RSpec.describe Language, type: :model do
  it 'should have valid Factory' do
    expect(create(:language)).to be_valid
  end

  describe 'Database table' do
    it { is_expected.to have_db_column :native }
    it { is_expected.to have_db_column :learn }
    it { is_expected.to have_db_column :name }
    it { is_expected.to have_db_column :created_at }
    it { is_expected.to have_db_column :updated_at }
    it { is_expected.to have_db_column :id }
  end

  describe 'Associations' do
    it { is_expected.to have_and_belong_to_many :users }  
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of(:name) }
  end
end
