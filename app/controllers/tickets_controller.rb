class TicketsController < ApplicationController
	before_action :set_project
	before_action :set_ticket, only: [:show, :edit, :update, :destroy]

	def new
		# The tickets method on Project objects is defined by calling an association method in the 
		# Project class called has_many, which can be found in app/models/project.rb.
		# The build method is equivalent to new for the Ticket class, but it associates the new object
		# instantly with the @project object by setting a foreign key called project_id in the Ticket table automatically.
		@ticket = @project.tickets.build
	end 

	def create
		@ticket = @project.tickets.build ticket_params

		if @ticket.save
			flash[:notice] = "Ticket has been created."
			redirect_to [@project, @ticket]
		else
			flash.now[:alert] = "Ticket has not been created."
			render "new"
		end 
	end 

	def show 
	end

	private 

	def ticket_params
		params.require(:ticket).permit(:name, :description)
	end

	def set_project
		@project = Project.find params[:project_id]
	end

	def set_ticket
		@ticket = @project.tickets.find(params[:id])
	end

end
