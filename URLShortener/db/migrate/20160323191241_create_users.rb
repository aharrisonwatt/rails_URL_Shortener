class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.email_address :email, null: false

      t.timestamps
    end
  end
end
