class PermissionsController < ApplicationController
  before_filter :authenticate_user!

  # These are granted automatically by site code:
  BLOCK_ROLES = ['user', 'site_admin']

  def create
    return if not require_perm('grant_roles', params[:qualifier])

    @permission = Permission.new(params[:permission])
    @permission.user = User.find(params[:user_id])
    @permission.qualifier = params[:qualifier].to_i

    # Make sure the target user is a member of the given league:
    if Member.where(['user_id = ? AND league_id = ?', @permission.user.id, 
      @permission.qualifier]).length == 0
      redirect_to(:back, :notice => "Error granting permission: user not in league.")
      return
    elsif BLOCK_ROLES.include?(@permission.role) 
      redirect_to(:back, :notice => "Cannot grant this role: #{@permission.role}")
      return
    end


    if @permission.save
      redirect_to(:back, :notice => 'Permission granted.')
    else
      pp @permission.errors
      redirect_to(:back, :notice => "Error granting permission: #{@permission.errors}")
    end
  end
 
  def destroy
    @perm = Permission.find(params[:id])
    # TODO: make sure user matches?
    return if not require_perm('grant_roles', @perm.qualifier)
    
    # Make sure we're not removing the last league admin:
    if @perm.role == 'league_admin' and Permission.where(
      ["role = 'league_admin' AND qualifier = ?", @perm.qualifier]).length == 1
      redirect_to(:back, :notice => "Cannot revoke last league admin.")
      return
    end

    if @perm.destroy
      redirect_to(:back, :notice => "Permission revoked.")
    else
      redirect_to(:back, :notice => "Error revoking permission.")
    end
  end

end
