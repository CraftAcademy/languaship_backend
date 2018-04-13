require 'rails_helper'

RSpec.describe Location, type: :model do
  describe 'assosiations' do 
    it { is_expected.to belong_to :user }
    
  end

  describe 'Database table' do
    it { is_expected.to have_db_column :id }
    it { is_expected.to have_db_column :locale }
    it { is_expected.to have_db_column :user_id }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of(:locale) }
  end
end

