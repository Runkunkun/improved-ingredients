defmodule Ingredients.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      IngredientsWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Ingredients.PubSub},
      # Start the Endpoint (http/https)
      IngredientsWeb.Endpoint
      # Start a worker by calling: Ingredients.Worker.start_link(arg)
      # {Ingredients.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Ingredients.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    IngredientsWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
