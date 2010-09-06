class AccountsController < ApplicationController
  # GET /accounts
  # GET /accounts.xml
  def index
    @accounts = Account.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @accounts }
    end
  end

  # GET /accounts/1
  # GET /accounts/1.xml
  def show
    @account = Account.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @account }
    end
  end

  # GET /accounts/new
  # GET /accounts/new.xml
  def new
    @account = Account.new

    @user = User.find(params[:user_id])
    return if not can_edit_user?

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @account }
    end
  end

#   # GET /accounts/1/edit
#   def edit
#     @account = Account.find(params[:id])
#   end
  def can_edit_user?
    if not user_signed_in?
      return false
    end

    if (@user.id == get_current_user().id or 
      require_perm('edit_user', @user.id))
      return true
    end
    return false
  end

  # POST /accounts
  # POST /accounts.xml
  def create
    @user = User.find(params[:user_id])
    return if not can_edit_user?

    @account = @user.accounts.create(params[:account])

    respond_to do |format|
      if @account.save
        format.html { redirect_to(@account, :notice => 'Account was successfully created.') }
        format.xml  { render :xml => @account, :status => :created, :location => @account }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @account.errors, :status => :unprocessable_entity }
      end
    end
  end

#   # PUT /accounts/1
#   # PUT /accounts/1.xml
#   def update
#     @account = Account.find(params[:id])

#     respond_to do |format|
#       if @account.update_attributes(params[:account])
#         format.html { redirect_to(@account, :notice => 'Account was successfully updated.') }
#         format.xml  { head :ok }
#       else
#         format.html { render :action => "edit" }
#         format.xml  { render :xml => @account.errors, :status => :unprocessable_entity }
#       end
#     end
#   end

#   # DELETE /accounts/1
#   # DELETE /accounts/1.xml
#   def destroy
#     @account = Account.find(params[:id])
#     @account.destroy

#     respond_to do |format|
#       format.html { redirect_to(accounts_url) }
#       format.xml  { head :ok }
#     end
#   end
end
