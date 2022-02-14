FactoryBot.define do
  factory :user_admin do
    id { 1 }
    email { 'test@admin.com' }
    password { 'password' }
    user_type { 'admin' }
  end
  factory :user_chef do
    id { 2 }
    email { 'test@chef.com' }
    password { 'password' }
    user_type { 'chef' }
  end
  factory :user_client do
    id {3}
    email { 'test@client.com' }
    password { 'password' }
    user_type { 'client' }
  end
end
