defmodule ProjetApiWeb.WorkingtimeController do
  use ProjetApiWeb, :controller

  alias ProjetApi.API
  alias ProjetApi.API.Workingtime

  action_fallback ProjetApiWeb.FallbackController

  def index(conn, _params) do
    workingtimes = API.list_workingtimes()
    render(conn, "index.json", workingtimes: workingtimes)
  end

  # WIP
  # def get_user_worktimes_by_timeslot(conn, %{}) do
  #   params = conn.query_params
  #   workingtimes = API.get_user_worktime_by_timeslot(Map.get)
  # end

  def get_user_worktime(conn, %{}) do
    params = conn.query_params
    worktime = API.get_user_worktime(Map.get(params, "userID"), Map.get(params, "workingtimeID"))
    render(conn, "show.json", workingtime: worktime)
  end

  def create(conn, %{"workingtime" => workingtime_params}) do
    with {:ok, %Workingtime{} = workingtime} <- API.create_workingtime(workingtime_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.workingtime_path(conn, :show, workingtime))
      |> render("show.json", workingtime: workingtime)
    end
  end

  def show(conn, %{"id" => id}) do
    workingtime = API.get_workingtime!(id)
    render(conn, "show.json", workingtime: workingtime)
  end

  def update(conn, %{"id" => id, "workingtime" => workingtime_params}) do
    workingtime = API.get_workingtime!(id)

    with {:ok, %Workingtime{} = workingtime} <- API.update_workingtime(workingtime, workingtime_params) do
      render(conn, "show.json", workingtime: workingtime)
    end
  end

  def delete(conn, %{"id" => id}) do
    workingtime = API.get_workingtime!(id)

    with {:ok, %Workingtime{}} <- API.delete_workingtime(workingtime) do
      send_resp(conn, :no_content, "")
    end
  end
end
