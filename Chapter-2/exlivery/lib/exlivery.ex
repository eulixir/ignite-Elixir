defmodule Exlivery do
  alias Exlivery.Users.CreateOrUpdate
  alias Exlivery.Users.Agent, as: UserAgent

  def start_agents do
      UserAgent.start_link(%{})
  end

  defdelegate create_or_update_user(params), to: CreateOrUpdate, as: :call

end
