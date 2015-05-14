# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# States data with code and type
states =  [
            ["Andaman and Nicobar Islands", "AN", "union territory"], ["Andhra Pradesh", "AP", "state"], 
            ["Arunachal Pradesh", "AR", "state"], ["Assam", "AS", "state"], ["Bihar", "BR", "state"],
            ["Chandigarh", "CH", "union territory"], ["Chhattisgarh", "CT", "state"], 
            ["Damen and Diu", "DD", "union territory"], ["Delhi", "DL", "union territory"],
            ["Dadra and Nagar Haveli", "DN", "union territory"], ["Goa", "GA", "state"], 
            ["Gujarat", "GJ", "state"], ["Himachal Pradesh", "HP", "state"], ["Haryana", "HR", "state"], 
            ["Jharkhand", "JH", "state"], ["Jammu and Kashmir", "JK", "state"], ["Karnataka", "KA", "state"],
            ["Kerala", "KL", "state"], ["Lakshadweep", "LD", "union territory"], 
            ["Maharashtra", "MH", "state"], ["Meghalaya", "ML", "state"], ["Manipur", "MN", "state"], 
            ["Madhya Pradesh", "MP", "state"], ["Mizoram", "MZ", "state"], ["Nagaland", "NL", "state"], 
            ["Orissa", "OR", "state"], ["Punjab", "PB", "state"], ["Puducherry", "PY", "union territory"],
            ["Rajasthan", "RJ", "state"], ["Sikkim", "SK", "state"], ["Tamil Nadu", "TN", "state"], 
            ["Tripura", "TR", "state"], ["Uttar Pradesh", "UP", "state"], ["Uttarakhand", "UT", "state"], 
            ["West Bengal", "WB", "state"]
          ]

# Creating states with code and type
states.each do |state|
  state = State.create!(name: state[0], code: state[1], state_type: state[2])
end

# Creating sample admin
Admin.create!(email: "admin@test.com",
             password: "12345678",
             password_confirmation: "12345678")