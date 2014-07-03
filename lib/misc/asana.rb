class Asana
  def initialize(token)
    @headers = {"Authorization" => "Bearer #{token}"}
  end

  def api_url(endpoint)
    "https://app.asana.com/api/1.0/#{endpoint}"
  end
  
  def get_user_data
    @data ||= HTTParty.get(api_url("users/me"), headers: @headers)
  end

  def get_workspace_data(workspace_id, item)
    t = Time.now
    @workspace_data ||= HTTParty.get(api_url("workspaces/#{workspace_id}/#{item}"), headers: @headers)
    puts "ran get_workspace_data, took #{Time.now - t}"
    @workspace_data
  end

  def default_workspace
    get_user_data["data"]["workspaces"].first["id"]
  end

  def list_workspaces
    get_user_data["data"]["workspaces"]
  end

  def list_projects(workspace)
    
  end

  def default_assignee
    # get_user_data >> assignee = current_user, then check via ternary
  end

  def default_notes
    "Created with Task2Asana"    
  end

  def create_task(name, workspace: :nil, assignee: "", notes: :nil)
    space       = workspace.present? ? workspace : default_workspace
    tasknotes   = notes.present? ? notes : default_notes
    result      = HTTParty.post(
      api_url("tasks"), 
      headers: @headers,
      query: {
        "name" => name, 
        "workspace" => space, 
        "assignee" => get_user_data["data"]["id"],
        "notes" => tasknotes
      })
  end


end