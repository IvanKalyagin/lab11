class CreatePalindromes < ActiveRecord::Migration[7.0]
  def change
    create_table :palindromes do |t|
      t.string 'input'
      t.string 'output'
      t.index ['input'], name: 'index_on_input', unique: true
      t.timestamps
    end
  end
end
