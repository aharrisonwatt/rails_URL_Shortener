class Visits < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.integer :shortened_url_id, presence: true
      t.integer :user_id, presence: true

      t.timestamps
    end

    add_index :visits, :user_id
  end

end
