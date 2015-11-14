module Spontan

  effect :change_name, with: 'User' do |user|
    user.name = 'alice'
  end

  rule fires: [:change_name], with: 'User' do |user|
    user.name == 'bob'
  end

end