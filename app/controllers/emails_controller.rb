class EmailsController < ApplicationController
  
  filter_resource_access # declarative_authorization
  
  # GET /emails
  # GET /emails.json
  def index
    @emails = current_user.emails.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @emails }
    end
  end

  # GET /emails/1
  # GET /emails/1.json
  def show
    @email = Email.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @email }
    end
  end

  # GET /emails/new
  # GET /emails/new.json
  def new
    @email = Email.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @email }
    end
  end

  # GET /emails/1/edit
  def edit
    @email = Email.find(params[:id])
  end

  # POST /emails
  # POST /emails.json
  def create
    @email = current_user.emails.build(params[:email])

    respond_to do |format|
      if @email.save
        format.html { redirect_to new_email_path, :notice => 'Thank you! You have successfully joined our list.' }
        format.json { render :json => @email, :status => :created, :location => @email }
      else
        format.html { render :action => "new" }
        format.json { render :json => @email.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /emails/1
  # PUT /emails/1.json
  def update
    @email = Email.find(params[:id])

    respond_to do |format|
      if @email.update_attributes(params[:email])
        format.html { redirect_to @email, :notice => 'Email was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @email.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /emails/1
  # DELETE /emails/1.json
  def destroy
    @email = Email.find(params[:id])
    @email.destroy

    respond_to do |format|
      format.html { redirect_to emails_url }
      format.json { head :ok }
    end
  end
end
