class Snp < ActiveRecord::Base
   has_many :user_snps
   has_many :plos_paper
   has_many :mendeley_paper
   has_many :snpedia_paper
   serialize :allele_frequency
   serialize :genotype_frequency
   
   after_initialize :default_frequencies

   def default_frequencies
	   # if variations is empty, put in our default array
	   self.allele_frequency ||= { "A" => 0, "T" => 0, "G" => 0, "C" => 0}
	   self.genotype_frequency ||= {}
   end

   def ranking
	   return mendeley_paper.count + plos_paper.count + snpedia_paper.count
   end
end
