package com.chrnie.lame;

import android.os.Bundle;
import android.view.View;
import android.view.View.OnClickListener;
import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;

public class MainActivity extends AppCompatActivity {

  @Override
  protected void onCreate(@Nullable Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    setContentView(R.layout.activity_main);

    View btn = findViewById(R.id.btn);
    btn.setOnClickListener(new OnClickListener() {
      @Override
      public void onClick(View v) {
        Mp3Encoder mp3Encoder = new Mp3Encoder();
        mp3Encoder.init(
            "/sdcard/xtcdata/telwatch/weichat/test.pcm",
            2, 128 * 1024, 44100,
            "/sdcard/xtcdata/telwatch/weichat/test-encode.mp3"
        );
        mp3Encoder.encode();
        mp3Encoder.destroy();
      }
    });
  }
}
