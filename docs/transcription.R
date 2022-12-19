result=gl_speech("gs://a_transcrire/audio-file.flac",
          languageCode="en-GB",
          encoding="FLAC",
          sampleRateHertz=44100)
result2=gl_speech("gs://a_transcrire/OSR_fr_000_0041_8k.wav",
                 languageCode="fr-FR",
                 asynch=TRUE,
                 sampleRateHertz=8000)
gl_speech_op(result2)




readWave("docs/a_transcrire/OSR_fr_000_0041_8k.wv")
wave=tuneR::readMP3("docs/Int15.mp3", header=TRUE)
sample=seewave::cutw(wave,
              from=0,
              to=60,
              output="Wave")
samplem=tuneR::mono(sample, which=c("left","right","both"))
tuneR::writeWave(samplem, "docs/sample.wav")
tuneR::readWave("docs/sample.wav")
tuneR::writeWave(samplem, "docs/test.csv",extensible=FALSE)

library(googleLanguageR)

my_config <- list(diarizationConfig = list(
                    enableSpeakerDiarization = TRUE,
                    minSpeakerCount = 2,
                    maxSpeakerCount = 2
                  ))

result_int=gl_speech("docs/test.csv",
                  languageCode="fr-FR",
                  asynch=TRUE,
                  sampleRateHertz=48000,
                  customConfig=my_config)
gl_speech_op(result_int)
