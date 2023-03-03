defmodule Asm do
  @moduledoc """
  A compiler that compiles to assembly.
  """

  # Whitespace
  @space " "
  @tab "\t"
  @newline "\n"
  @return "\r"

  # For now we only support single line comments.
  @comment_start "//"

  # If there is white space we just continue
  def parse(@space <> source_code), do: parse(source_code)
  def parse(@tab <> source_code), do: parse(source_code)
  def parse(@newline <> source_code), do: parse(source_code)
  def parse(@return <> source_code), do: parse(source_code)

  def parse(@comment_start <> source_code) do
    parse_comment(source_code)
  end

  defp parse_comment(source_code) do
    case source_code |> parse_until([@newline, @return], "") do
      :terminal_char_never_reached ->
        {:syntax_error, ""}
    end
  end


  # could we inline this? Would that be better?
  @doc """
       Splits a binary into everything up to the a terminating character, the terminating
       character and everything after that.

       This iterates through the binary one byte at a time which means the terminating char should
       be one byte. If multiple terminating chars are provided we stop as soon as we see any one
       of them.

       It's faster to keep this in this module as the match context gets re-used if we do.
       you can see the warnings if you play around with this:

          ERL_COMPILER_OPTIONS=bin_opt_info mix compile --force
       """ && false
  def parse_until(<<>>, _terminal_char, _acc), do: :terminal_char_never_reached

  def parse_until(<<head::binary-size(1), rest::binary>>, [_ | _] = terminal_chars, acc) do
    if head in terminal_chars do
      {head, acc, rest}
    else
      parse_until(rest, terminal_chars, acc <> head)
    end
  end

  def parse_until(<<head::binary-size(1), rest::binary>>, terminal_char, acc) do
    case head do
      ^terminal_char -> {head, acc, rest}
      char -> parse_until(rest, terminal_char, acc <> char)
    end
  end
end
