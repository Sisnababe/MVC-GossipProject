require 'gossip'
require 'view'


class Controller

    def create_gossip
      params = @view.create_gossip
      gossip = Gossip.new(params[:author], params[:content])
      #pour le moment, le contenu de ce gossip est inscrit "en dur" dans le code. L'utilisateur ne peut pas le changer.
      gossip.save
      # Instancier la classe Gossip
      # Utiliser la méthode correspondante de la classe View pour afficher le potin créé
    end

    def initialize
      @view = View.new
    end

    def index_gossips
      params = Gossip.all
      @view.index_gossips(params)
    end
    
    def destroy_gossip
       params = @view.destroy_gossip
       Gossip.destroy_gossip(params)
    end
end