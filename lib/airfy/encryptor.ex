defmodule Airfy.Encryptor do
  @doc """
  Takes key to be used and
  """
  def encrypt(key, data) when is_binary(key) and is_binary(data) do
    key
    |> adopt
    |> SipHash.hash!(data)
  end

  defp adopt(key) do
    :crypto.hash(:sha256, key) |> Base.encode64 |> String.slice(0, 16)
  end
end
