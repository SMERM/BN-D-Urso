
require 'yaml'
require 'byebug'


class Soundscape

  attr_reader :key, :name, :category, :duration, :recordingdate, :recording_microphone
  # TODO: aggiungere caratteristiche

  def initialize(key, aa)
    @key = key
    @name = aa['name']
    @category = aa['category']
    @duration = aa['duration']
    @recordingdate = aa['recordingdate']
    @recording_microphone = aa['recording microphone']
    # TODO -> caricare le altre caratteristiche
  end

end

class CilentoSoundscapes

  attr_reader :soundscapes, :configuration_file

  def initialize(file)
    @configuration_file = file
    @soundscapes = setup()
  end

private

  def setup()
    yaml_soundscapes = YAML.load(File.open(self.configuration_file, 'r'))
    res = []
    yaml_soundscapes.each do
      |k, v|
      s = Soundscape.new(k, v)
      res << s
    end
    return res
  end

end

#############################

css = CilentoSoundscapes.new("YAML_database.yml")

print css.inspect() + "\n"

print css.soundscapes[0].inspect() + "\n"

