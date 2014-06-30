class Asana
  def initialize(token)
    @headers = {"Authorization" => "Bearer #{token}"}
  end

  def api_url(endpoint)
    "https://app.asana.com/api/1.0/#{endpoint}"
  end
  
  def get_user_data
    HTTParty.get(api_url("users/me"), headers: @headers)
  end

  def default_workspace
    get_user_data["data"]["workspaces"].first["id"]
  end

  def create_task(name, workspace: default_workspace)
    HTTParty.post(
      api_url("tasks"), 
      headers: @headers,
      query: {
        "name" => name, 
        "workspace" => workspace, 
        "assignee" => get_user_data["data"]["id"]
      })
  end


end