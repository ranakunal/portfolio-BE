class ProjectsController < ApplicationController
  def index
    render json: [
      { id: 1, name: "Portfolio Website", description: "React + Rails site" },
      { id: 2, name: "Task Manager", description: "Rails API + React App" }
    ]
  end
end