class CreateSnps < ActiveRecord::Migration
  def self.up
	  create_table :snps do |t|
		  t.string :name
		  t.string :position
		  t.string :genotype
		  t.belongs_to :user
		  
		  t.timestamps
	  end
  end

  def self.down
  	drop_table :snps
  end
end
