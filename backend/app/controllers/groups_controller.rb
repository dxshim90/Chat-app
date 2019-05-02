class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :update, :destroy]

  def index
    groups = Group.all

    render json: groups
  end

  def show
    render json: group
  end

  def create
    group = Group.new(group_params)

    if group.save
      render json: group, status: :created, location: group
    else
      render json: {error: "Group was not created"}, status: 400
    end
  end

  def update
    if group.update(group_params)
      render json: group
    else
      render json: {error: "Group was not updated."}, status: 451
    end
  end

  def destroy
    group.destroy
  end

  private
  
    def set_group
      group = Group.find(params[:id])
    end

    def group_params
      params.require(:group).permit(:name)
    end
end
