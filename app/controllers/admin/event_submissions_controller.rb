class Admin::EventSubmissionsController < ApplicationController
  before_action :check_if_admin 

  def index
    def index
      @events = Event.showall
    end

  end
  def show
    @detail = Event.find(params[:id])
    @events = Event.tovalidate
  end

  def edit
    @detail = Event.find(params[:id])
  end

  def update
    @events = Event.showall
    @detail = User.find(params[:id])
      
    event_params= params.require(:event).permit(:email,:description,:first_name,:last_name,:is_admin)    
      if @detail.update(event_params) # essaie de sauvegarder en base @gossip
            
      redirect_to admin_user_path(@detail.id) # si ça marche, il redirige vers la page d'index du site
    else
      render :edit  # sinon, il render la view new (qui est celle sur laquelle on est déjà)
    end
  end
  def destroy
    @detail = User.find(params['id'])
    @detail.destroy 
    flash[:danger] = "L'utilisateur #{@detail.email} à bien été supprimmé"
    redirect_to '/admin'

  end

  private
  def check_if_admin

    if current_user == nil
      flash[:danger] = "Vous n'avez pas acces a cette page"
      redirect_to '/'
    elsif current_user.is_admin == false
      flash[:danger] = "Vous n'avez pas acces a cette page"
      redirect_to '/'    
    end
  end
end
