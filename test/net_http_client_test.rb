require 'test_helper'
require 'socket'
require 'tempfile'
require 'fileutils'

module PortaText
  module Test
    # Tests the Net::HTTP client mplementation.
    #
    # Author::    Marcelo Gornstein (mailto:marcelog@portatext.com)
    # Copyright:: Copyright (c) 2015 PortaText
    # License::   Apache-2.0
    class NetHttpClient < Minitest::Test
      def test_request_error
        uri = "http://127.0.0.1:65534"
        descriptor = PortaText::Command::Descriptor.new(
          uri, :post, {"h1" => "v1"}, "body"
        )
        client = PortaText::Client::HttpClient.new
        assert_raises PortaText::Exception::RequestError do
          client.execute descriptor
        end
      end

      def test_get
        run_method :get
      end

      def test_post
        run_method :post
      end

      def test_put
        run_method :put
      end

      def test_delete
        run_method :delete
      end

      def test_patch
        run_method :patch
      end

      def test_request_send_file
        tmp_file = Tempfile.new "tmp"
        tmp_file.write "these are the file contents"
        tmp_file.close
        run_method :post, tmp_file.path
        tmp_file.delete
      end

      def test_request_save_to_file
        tmp_file = Tempfile.new "tmp"
        tmp_file.close
        run_method :post, nil, tmp_file.path
        tmp_file.delete
      end

      private

      def run_method(method, file = nil, output_file = nil)
        port = 50_000
        recv_file = Tempfile.new "received#{port}"
        accept_file = Dir::Tmpname.make_tmpname "/tmp/accept#{port}", nil
        body, size = if file.nil?
          ['a body', 6]
        else
          [IO.binread(file), File.size(file)]
        end
        Process.fork do
          server = TCPServer.new port
          server.setsockopt :SOCKET, :REUSEADDR, 1
          server.listen 10
          FileUtils.touch accept_file
          client = server.accept
          buffer = ''
          loop do
            new_buff = client.recv 2_048
            buffer = buffer + new_buff
            break if buffer.match(body)
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
          client.close
          server.close
          Process.exit! true
        end
        client = PortaText::Client::HttpClient.new
        loop do
          break if File.exist? accept_file
          sleep 0.05
        end
        sleep 0.05
        res_code, res_headers, res_body = client.execute(
          PortaText::Command::Descriptor.new(
            "http://127.0.0.1:#{port}/some/endpoint",
            method, { 'header1' => 'value1' },
            if file.nil?
              body
            else
              "file:#{file}"
            end,
            output_file
          )
        )
        assert res_code == 742
        assert res_headers == {
          'connection' => 'close',
          'x-header1' => 'value1',
          'x-header2' => 'value2'
        }
        if output_file.nil?
          assert res_body == '{"success":true}'
        else
          assert File.readlines(output_file).shift == '{"success":true}'
        end
        content = File.readlines recv_file
        assert "#{method.upcase} /some/endpoint HTTP/1.1" == content[0].chop
        assert body == content[content.length - 1]
        recv_file.delete
        File.unlink accept_file
      end
    end
  end
end
