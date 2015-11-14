# Spontan

Spontan adds Rules & Effects to Rails apps. A glorified `if` statement.

## Usage

Activate it in a model

```ruby
class User < ActiveRecord::Base

  is_spontan
  
end
```

Define Effects and Rules in `app/models/effects/user_effects.rb`

```ruby
module Spontan

  effect :change_name, with: 'User' do |user|
    user.name = 'alice'
  end

  rule fires: [:change_name], with: 'User' do |user|
    user.name == 'bob'
  end

end
```

Call it somewhere

```ruby
user.spontan_effects
```

If a rule block evaluates to `true`, all effects in `fires` are realized.
