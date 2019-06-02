#ifndef MP3_ENCODER_H
#define MP3_ENCODER_H

#include "lame.h"

class Mp3Encoder {
 private:
  FILE *pcmFile;
  FILE *mp3File;
  lame_t lameClient;

 public:
  Mp3Encoder();
  ~Mp3Encoder();

  int
  Init(const char *pcmFilePath, const char *mp3FilePath, int sampleRate, int channels, int bitRate);
  void Encode();
  void Destory();
};

#endif //MP3_ENCODER