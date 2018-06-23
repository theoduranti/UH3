class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  # GET /events
  # GET /events.json
  def index
    @events = Event.all
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @event = Event.find(params[:id])
    @allele = Ele.all
    @allpro = Pro.all
    
    if @event.naturecreateur == "eleve"
      @creator = Ele.find(@event.creator_id)
    elsif @event.naturecreateur == "professeur"
      @creator = Pro.find(@event.creator_id)
      @professor = Pro.find(@event.professor_id)
    else
    end
    if @event.professeur == "present"
      @professor = Pro.find_by_id(@event.professor_id)
    else
    end
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)
    @event.professeur = "vide"
    @event.etat = "open"
    
    if ele_signed_in?
      @event.creator_id = current_ele.id
      @event.naturecreateur = "eleve"
      @event.asubscribe << current_ele.id
      @event.apayer << 0
    elsif pro_signed_in?
      @event.creator_id = current_pro.id
      @event.naturecreateur = "professeur"
      @event.professeur = "present"
      @event.professor_id = current_pro.id
    else
    end

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def subscribe
    @event = Event.find(params[:id])
    @user = current_ele
    @pro = current_pro

    if ele_signed_in?
      @event.eleattendees << current_ele
      @event.update_attribute(:asubscribe, @event.asubscribe << current_ele.id)
    else
      if 
        @event.professor_id == nil
        @event.update_column(:professor_id, current_pro.id)
        @event.update_column(:professeur, "present")
      end
    end
    redirect_to @event
  end


  def pay
    @user = current_ele
    @event = Event.find(params[:id])
# faire payer grace a stripe et une fois que c'est fait, envoie de l'email avec pass
    @amount = 500
        
    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Rails Stripe customer',
      :currency    => 'usd'
    )

    

    rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path


    redirect_to @event
  end

  
# devrait être nommée def after_after_subscribeandpay, à corriger, avec recherche, remplace
  def after_subscribeandpay
    @event = Event.find(params[:id])
    if ele_signed_in?
      
      @event.update_attribute(:asubscribe, @event.asubscribe << current_ele.id)
      @event.update_attribute(:apayer, @event.apayer << current_ele.id)
    end
    redirect_to @event
  end

# Le .include, faut peut être le mettre dans un .each, ou peut être qu'il n'est pas nécessaire
  def after_pay
    @event = Event.find(params[:id])
    @user = current_ele
    if ele_signed_in?
      @event.asubscribe.each do |iiid|
        if current_ele.id == iiid
          @event.update_attribute(:apayer, @event.apayer << current_ele.id)
        end
      end
    else
    end
    redirect_to @event
  end

  


  def addeletoinvitation  
    @ele = Ele.find(params[:ele_id])
    @event = Event.find(params[:test])
 #   if 
 #   @event.attendees.include? @user
 #   flash[:danger] = "#{@user.name} participe déjà à l'événement !" 
 #   redirect_to @event
 #   else
    @event.eleattendees << @ele
    flash[:success] = "#{@ele.firstname} est ajouté à l'événement ! !" 
    redirect_to @event
 #   end
  end


  def addprotoinvitation  
    @pro = Pro.find(params[:pro_id])
    @event = Event.find(params[:test])
 #   if 
 #   @event.attendees.include? @user
 #   flash[:danger] = "#{@user.name} participe déjà à l'événement !" 
 #   redirect_to @event
 #   else
    @event.proinvitatees << @pro
    flash[:success] = "#{@pro.firstname} est ajouté à l'événement ! !" 
    redirect_to @event
 #   end
  end


  def closingevent
    @event = Event.find(params[:id])
    @event.update_columns(etat: "close")
    

  # il faudra qu'elle envoie un mail à tous les ele enregistrés dans @event.asubscribeX
  # "le prof a validé l'event, allez sur la page de l'event pour payer et recevoir votre pass"
    redirect_to @event
  end





  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from  the scary internet, only allow the white list through.
    def event_params
      params.fetch(:event, {})
      params.require(:event).permit(:name, :discipline, :description, :date, :ville, :prix)
    end
end
