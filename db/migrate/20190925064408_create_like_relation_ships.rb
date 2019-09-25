class CreateLikeRelationShips < ActiveRecord::Migration[6.0]
  def change
    create_table :like_relation_ships do |t|
      t.references :user, null: false, foreign_key: true
      t.references :article, null: false, foreign_key: true

      t.timestamps
    end
  end
end
