class Asana
  def initialize(token)
    @headers = {"Authorization" => "Bearer #{token}"}
  end

  def api_url(endpoint)
    "https://app.asana.com/api/1.0/#{endpoint}"
  end

  def get_asana_endpoint(endpoint)
    result = HTTParty.get(api_url(endpoint), headers: @headers)
    if result.response.is_a?(Net::HTTPOK)
      return result
    elsif result.response.is_a?(Net::HTTPUnauthorized)
      raise "Asana token not allowed"
    else
      raise "Big mistake."
    end
  end
  
  def get_user_data
    @data ||= get_asana_endpoint("users/me")
  end

  def get_workspace_data(workspace_id, item)
    @workspace_data ||= get_asana_endpoint("workspaces/#{workspace_id}/#{item}")
  end

  def default_workspace
    get_user_data["data"]["workspaces"].first["id"]
  end

  def list_workspaces
    get_user_data["data"]["workspaces"]
  end

  def get_workspace_name_from_id(lookupid)
    arr               = list_workspaces
    workspace_arr     = arr.map{ |i| i["id"] }
    workspace = arr.find_all{ |i| i["id"] == lookupid }
    workspace.first["name"]
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