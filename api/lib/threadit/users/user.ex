defmodule Threadit.Users.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field(:username, :string)
    field(:password_hash, :string, redact: true)
    field(:password, virtual: true, redact: true)

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:username, :password])
    |> validate_required([:username, :password])
    |> validate_format(:username, ~r/^[a-z0-9_-]+$/,
      message: "must be lowercase and can only contain letters, numbers, hyphens, and underscores"
    )
    |> validate_length(:username, min: 3, max: 32, message: "must be between 3 and 32 characters")
    |> validate_length(:password, min: 12, max: 72)
    |> validate_format(:password, ~r/[a-z]/, message: "at least one lower case character")
    |> validate_format(:password, ~r/[A-Z]/, message: "at least one upper case character")
    |> validate_format(:password, ~r/[!?@#$%^&*_0-9]/,
      message: "at least one digit or punctuation character"
    )
    |> unique_constraint(:username)
  end
end
