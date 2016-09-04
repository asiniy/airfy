defmodule Airfy do
  import Airfy.Encryptor

  def main(args) do
    opts = args
      |> parse_args
      |> validate_args
      |> modify_key_path_to_key

    encrypt(opts[:key], opts[:message])
    |> IO.puts
  end

  defp parse_args(args) do
    { options, _, _ } = OptionParser.parse(args)
    options
  end

  defp validate_args(args) do
    args
    |> validate_presence(:key_path)
    |> validate_key_path_file_existance
    |> validate_presence(:message)
  end

  defp validate_presence(args, arg_name) do
    unless Keyword.get(args, arg_name) do
      IO.puts "Please set #{arg_name} param"
      Process.exit(self, :normal)
    end

    args
  end

  defp validate_key_path_file_existance(args) do
    unless File.exists?(args[:key_path]) do
      IO.puts "Can't find a key file. Ensure --key-path points to existing file"
      Process.exit(self, :normal)
    end

    args
  end

  defp modify_key_path_to_key(args) do
    { :ok, file } = File.read(args[:key_path])

    args
    |> Keyword.delete(:key_path)
    |> Keyword.put(:key, file)
  end
end
