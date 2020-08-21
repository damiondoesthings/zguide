defmodule Hwclient do
  @moduledoc """
  Generated by erl2ex (http://github.com/dazuma/erl2ex)
  From Erlang source: (Unknown source file)
  At: 2019-12-20 13:57:23

  """

  def main(_) do
    {:ok, context} = :erlzmq.context()
    :io.format('Connecting to hello world server...~n')
    {:ok, requester} = :erlzmq.socket(context, :req)
    :ok = :erlzmq.connect(requester, 'tcp://localhost:5555')
    :lists.foreach(fn n ->
      :io.format('Sending Hello ~b...~n', [n])
      :ok = :erlzmq.send(requester, "Hello")
      {:ok, reply} = :erlzmq.recv(requester)
      :io.format('Received ~s ~b~n', [reply, n])
    end, :lists.seq(1, 10))
    :ok = :erlzmq.close(requester)
    :ok = :erlzmq.term(context)
  end

end

Hwclient.main(:ok)