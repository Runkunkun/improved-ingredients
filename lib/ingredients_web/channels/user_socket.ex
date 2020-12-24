defmodule IngredientsWeb.UserSocket do
  use Phoenix.Socket

  channel "session:*", IngredientsWeb.SessionChannel
  @impl true
  def connect(%{"user" => user}, socket) do
    {:ok, assign(socket, :current_user, user)}
  end

  @impl true
  def id(_socket), do: nil
end
