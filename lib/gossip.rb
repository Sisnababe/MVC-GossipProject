#require 'pry'
require 'csv'

class Gossip
    # Ajouter ici les variables d'instance et les méthodes nécessaires pour la classe Gossip
    attr_reader :author, :content

    def initialize(author, content)
        @content = content
        @author = author
    end

    def save
        CSV.open("db/gossip.csv", "a") do |csv|
          csv << [@author, @content]
        end
      end

      def self.all
        # 1)création d'un array vide qui s'appelle all_articles
        all_gossips = []
        # 2)chaque ligne de ton CSV.each do |ligne|
        CSV.foreach("db/gossip.csv") do |row|
          # 2-a) aticle_provisoire = aticle.new(paramètres de la ligne) - permet de créer un objet aticle
          gossip_provisoire = Gossip.new(row[0],row[1])
          # 2-b) all_articles << aticle_provisoire - permet de rajouter le aticle provisoire au array
          all_gossips << gossip_provisoire
        end
        return all_gossips
      end

      def self.destroy_gossip(index)
        # 1) j'ouvre ma table csv ds un array
        gossips = CSV.read('db/gossip.csv')
        # 2) je delete ds mon array au bon index
        gossips.delete_at(index-1)
        # 3) j'ouvre mon fichier CSV
        CSV.open('db/gossip.csv', 'w') do |csv|
          # 4) je fais une boucle pr push tous mes articles restants ds le CSV
          gossips.each do |gossip|
            csv << gossip
          end
        end
      end
end   

#binding.pry
