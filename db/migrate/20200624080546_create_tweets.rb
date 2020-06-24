class CreateTweets < ActiveRecord::Migration[6.0]
  def change
    create_table :tweets do |t|
      t.text :content
      t.belongs_to :user, null: false, foreign_key: true
      t.integer :reply_to, default: 0
      t.integer :retweet_from, default: 0
      t.integer :like_count, default: 0
      t.datetime :deleted_at

      t.timestamps
    end
    add_index :tweets, :deleted_at
  end
end
