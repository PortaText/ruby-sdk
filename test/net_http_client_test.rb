require 'test_helper'
require 'socket'
require 'tempfile'

module PortaText
  module Test
    # Tests the Net::HTTP client mplementation.
    #
    # Author::    Marcelo Gornstein (mailto:marcelog@portatext.com)
    # Copyright:: Copyright (c) 2015 PortaText
    # License::   Apache-2.0
    class NetHttpClient < Minitest::Test
      def test_methods
        port = 54_320
        recv_file = Tempfile.new "received#{port}"
        Process.fork do
          server = TCPServer.new port
          server.setsockopt :SOCKET, :REUSEADDR, 1
          server.setsockopt :SOCKET, :REUSEPORT, 1
          server.listen 10
          client = server.accept
          buffer = ''
          loop do
            new_buff = client.recv 2048
            buffer = buffer + new_buff
            break if /a body/ =~ buffer
          end
          recv_file.write buffer
          recv_file.close

          client.puts 'HTTP/1.1 742 OK'
          client.puts 'Connection: close'
          client.puts 'X-header1: value1'
          client.puts 'X-header2: value2'
          client.puts ''
          hash = {success: true}
          client.write hash.to_json
          sleep 0.2

          client.close
          server.close
          Process.exit! true
        end
        client = PortaText::Client::HttpClient.new
        sleep 0.2
        code, headers, body = client.execute PortaText::Command::Descriptor.new(
          "http://127.0.0.1:#{port}",
          :post,
          {
            'header1' => 'value1'
          },
          "a body\r\n"
        )
        assert code == 742
        assert headers == {
          'connection' => 'close',
          'x-header1' => 'value1',
          'x-header2' => 'value2'
        }
        assert body == '{"success":true}'
        recv_file.delete
      end
    end
  end
end
