require 'rails_helper'

RSpec.describe Invoice, type: :model do
describe 'Relationships' do
  it {should belong_to :customer}
  it {should belong_to :merchant}
end

describe 'Validations' do
  it {should validate_presence_of(:status)}
end

end