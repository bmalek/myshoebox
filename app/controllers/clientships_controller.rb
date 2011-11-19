class ClientshipsController < ApplicationController
  
  filter_resource_access # declarative_authorization
  
  # GET /clientships
  # GET /clientships.json
  def index
    @clientships = current_user.clientships.all    

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @clientships }
    end
  end

  # GET /clientships/1
  # GET /clientships/1.json
  def show
    @clientship = current_user.clientships.find(params[:id])    

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @clientship }
    end
  end

  # GET /clientships/new
  # GET /clientships/new.json
  def new
    @clientship = Clientship.new
    @users = User.all


    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @clientship }
    end
  end

  # GET /clientships/1/edit
  def edit
    @clientship = Clientship.find(params[:id])
  end

  # POST /clientships
  # POST /clientships.json
  def create
    @clientship = current_user.clientships.build(:client_id => params[:client_id], :fee => params[:fee])

    respond_to do |format|
      if @clientship.save
        format.html { redirect_to @clientship, notice: 'Clientship was successfully created.' }
        format.json { render json: @clientship, status: :created, location: @clientship }
      else
        format.html { render action: "new" }
        format.json { render json: @clientship.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /clientships/1
  # PUT /clientships/1.json
  def update
    @clientship = current_user.clientships.find(params[:id])

    respond_to do |format|
      if @clientship.update_attributes(params[:clientship])
        format.html { redirect_to @clientship, notice: 'Clientship was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @clientship.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clientships/1
  # DELETE /clientships/1.json
  def destroy
    @clientship = current_user.clientships.find(params[:id])
    @clientship.destroy

    respond_to do |format|
      format.html { redirect_to clientships_url }
      format.json { head :ok }
    end
  end
end
