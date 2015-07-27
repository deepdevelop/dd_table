ActiveRecord::Schema.define do
  self.verbose = false

  create_table :users, :force => true do |t|
    t.string :email
    t.string :name
    t.integer :age

    t.timestamps null: false
  end

end