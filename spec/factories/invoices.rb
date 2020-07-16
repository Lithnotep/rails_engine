FactoryBot.define do
  factory :invoice do
    status { 'shipped' }
    merchant
    
  end
end
