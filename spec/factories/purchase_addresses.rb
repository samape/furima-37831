FactoryBot.define do
  factory :purchase_address do
    token { 'tok_abcdefghijk00000000000000000' }
    post_code     { '111-1111' }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    city          { '中野区' }
    address       { '中野3-3-3' }
    building      { 'ライオンズマンション101' }
    phone_num     { '1234567890' }
  end
end
