class RelationshipsController < ApplicationController
	def index; create;  end

	def new
		@relationship = Relationship.new
	end

	def create
		@follower = User.find_by_id @current_user
		@followed = User.find_by_id params[:followed]
		@relationship = Relationship.where(follower: @follower, followed: @followed)
		if @relationship.length==0
			@relationship = Relationship.create(follower: @follower, 
				followed: @followed)
		end
		redirect_to user_path params[:followed]
	end

	def destroy
		@relationship = Relationship.find_by_id(params[:id])
		@followed = @relationship.followed.id
		@relationship.destroy
		redirect_to user_path @followed
	end


end