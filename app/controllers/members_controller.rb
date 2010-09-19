class MembersController < ApplicationController

  before_filter :authenticate_user!

  def create
    # Link to this controller will not be shown if the user cannot join, if the request
    # were to be manufactured anyhow, the model validation should catch it.
    
    # TODO: Support closed registrations, approvals
   
    @league = League.find(params[:league_id])
    user = get_current_user
    logger.info("Processing join request for: %s\n" % user)
    member = Member.new(:user => user, :account => user.get_account(@league.game.platform))

    # TODO: Grant the host role to all league members for now:
    user.permissions << Permission.new(:role => 'host', :qualifier => @league.id)

    @league.members << member

    # TODO: transactions
    if @league.save and user.save
      redirect_to(@league, :notice => 'You have joined the league.')
    else
      redirect_to(@league, :notice => "Error joining league. #{member.errors}")
    end
  end
 
  def index
    @league = League.find(params[:league_id])
    @members = @league.members

    @roles_to_grant = [
      get_role('host'),
      get_role('league_admin'),
    ]
  end

#   # DELETE /leagues/1/members/1
#   def destroy
#     # TODO: Sort out issue with preserving stats
#     # TODO: prevent destroy if user is last league admin
#     @member = Member.find(params[:id])
#     @league = @member.league
#     @member.destroy

#     respond_to do |format|
#       format.html { redirect_to(league_path(@league), :notice => 'You have left the league.') }
#       format.xml  { head :ok }
#     end
#   end

end

