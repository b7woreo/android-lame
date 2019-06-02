#include "include/native-lib.h"
#include "include/mp3_encoder.h"

Mp3Encoder *encoder = NULL;

JNIEXPORT jint JNICALL Java_com_chrnie_lame_Mp3Encoder_init
    (JNIEnv *env, jobject obj, jstring pcmPathParam, jint channels, jint bitRate,
     jint sampleRate, jstring mp3PathParam) {
  const char *pcmPath = env->GetStringUTFChars(pcmPathParam, NULL);
  const char *mp3Path = env->GetStringUTFChars(mp3PathParam, NULL);
  encoder = new Mp3Encoder();
  encoder->Init(pcmPath, mp3Path, sampleRate, channels, bitRate);
  env->ReleaseStringUTFChars(mp3PathParam, mp3Path);
  env->ReleaseStringUTFChars(pcmPathParam, pcmPath);
  return 0;
}

JNIEXPORT void JNICALL Java_com_chrnie_lame_Mp3Encoder_encode(JNIEnv *env, jobject obj) {
  if (NULL != encoder) {
    encoder->Encode();
  }
}

JNIEXPORT void JNICALL Java_com_chrnie_lame_Mp3Encoder_destroy(JNIEnv *env, jobject obj) {
  if (NULL != encoder) {
    encoder->Destory();
    delete encoder;
    encoder = NULL;
  }
}
