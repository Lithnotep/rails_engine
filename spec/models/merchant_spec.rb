require 'rails_helper'

RSpec.describe Merchant, type: :model do
  describe 'Validations' do
    it {should validate_presence_of(:name)}
  end

  describe 'Relationships' do
    it {should have_many(:items)}
  end

  describe 'Methods' do
    it "can find most revenue" do

    end
  end
end
