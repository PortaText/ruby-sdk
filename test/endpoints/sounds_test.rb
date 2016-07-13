module PortaText
  module Test
    module Endpoints
      # Tests the Sounds endpoint.
      #
      # Author::    Marcelo Gornstein (mailto:marcelog@portatext.com)
      # Copyright:: Copyright (c) 2015 PortaText
      # License::   Apache-2.0
      class Sounds < PortaText::Test::Helper::CommandTester
        def test_can_delete_sound
          test_command 'sounds/763' do |client|
            client
              .sounds
              .id(763)
              .delete
          end
        end

        def test_can_update_sound_without_sound_file
          settings = {
            'description' => 'super duper sound',
            'name' => 'a sound'
          }
          test_command("sounds?#{URI.encode_www_form(settings)}") do |client|
            client
              .sounds
              .name('a sound')
              .description('super duper sound')
              .patch
          end
        end

        def test_can_update_sound
          settings = {
            'description' => 'super duper sound',
            'name' => 'a sound'
          }
          test_command(
            "sounds?#{URI.encode_www_form(settings)}",
            'file:/tmp/sound.mp3',
            'audio/mpeg'
          ) do |client|
            client
              .sounds
              .name('a sound')
              .description('super duper sound')
              .sound('/tmp/sound.mp3')
              .patch
          end
        end

        def test_can_create_sound
          settings = {
            'description' => 'super duper sound',
            'name' => 'a sound'
          }
          test_command(
            "sounds?#{URI.encode_www_form(settings)}",
            'file:/tmp/sound.mp3',
            'audio/mpeg'
          ) do |client|
            client
              .sounds
              .name('a sound')
              .description('super duper sound')
              .sound('/tmp/sound.mp3')
              .post
          end
        end

        def test_can_get_all_sounds
          test_command 'sounds' do |client|
            client
              .sounds
              .get
          end
        end

        def test_can_get_a_sound_file
          test_command(
            'sounds/763', '', 'application/json', 'audio/mpeg'
          ) do |client|
            client
              .sounds
              .save_to('/tmp/sound.mp3')
              .id(763)
              .get
          end
        end

        def test_can_get_a_sound
          test_command 'sounds/763' do |client|
            client
              .sounds
              .id(763)
              .get
          end
        end
      end
    end
  end
end
