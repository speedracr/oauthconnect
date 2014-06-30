token = User.first.token
headers = {"Authorization" => "Bearer #{token}"}
response = HTTParty.get('https://app.asana.com/api/1.0/users/me', headers: headers)


# Combine Asana doc >> curl syntax with HTTParty.post guidelines

token = User.first.token
headers = {"Authorization" => "Bearer #{token}"}
post = HTTParty.post(
  'https://app.asana.com/api/1.0/tasks', 
  headers: headers,
  query: {"name" => "Straight from the console", "workspace" => "162975249383"}
)


# Sort this code into a class to make it accessible. Set it up in lib and make sure it autoloads via application.rb