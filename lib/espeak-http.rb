%w(rubygems 
   sinatra 
   espeak-ruby
   digest/sha1).each { |l| require l }

include ESpeak

get '/tts' do
  filename = "tmp/#{Digest::SHA1.hexdigest(params.to_s)}.mp3"
  params['voice'] = '+m2'
  params['speed'] = 140
  params['pitch'] = 5
  params['amplitude'] = 50
  espeak(filename, params) # unless filename exists
  [200, {'Content-type' => 'audio/mpeg'}, File.read(filename)]
end
