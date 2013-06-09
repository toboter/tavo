class PeopleController < ApplicationController

  def index
    @people = Person.all
    render :layout => "index_template"
  end

  def show
    @person = Person.find(params[:id])
    @user = User.find_by_id(@person.user_id)
    render :layout => "show_template"
  end


  def new
    if params[:user_id]
      @person = Person.new(:user_id => params[:user_id])
    else
      @person = Person.new(:user_id => nil)
    end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @person }
    end
  end

  # GET /people/1/edit
  def edit
    @person = Person.find(params[:id])
  end

  # POST /people
  # POST /people.json
  def create
    @person = Person.new(params[:person])

    respond_to do |format|
      if @person.save
        format.html { redirect_to @person, notice: 'Person was successfully created.' }
        format.json { render json: @person, status: :created, location: @person }
      else
        format.html { render action: "new" }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /people/1
  # PUT /people/1.json
  def update
    @person = Person.find(params[:id])
    if params[:connect_user_id]
      @user = User.find(params[:connect_user_id])
      @person.user_id = @user.id
    end

    respond_to do |format|
      if @person.update_attributes(params[:person])
        format.html { redirect_to @person, notice: 'Person was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  
  end

  def connect_to_user
    @person = Person.find(params[:id])
    if params[:connect_user_id]
      @user = User.find(params[:connect_user_id])

      if @person.update_attribute(:user_id, @user.id)
        redirect_to @person, notice: "#{@person.fullname} mit #{@user.username} verbunden."
      else
        redirect_to root_url, notice: "Fehler beim Speichern."
      end
    else
      redirect_to root_url, notice: "Fehler in der Daten&uuml;bergabe."
    end
  end

  # DELETE /people/1
  # DELETE /people/1.json
  def destroy
    @person = Person.find(params[:id])
    @person.destroy

    respond_to do |format|
      format.html { redirect_to people_url }
      format.json { head :no_content }
    end
  end
end
