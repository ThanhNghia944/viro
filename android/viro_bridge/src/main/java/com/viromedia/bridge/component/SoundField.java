/**
 * Copyright © 2017 Viro Media. All rights reserved.
 */
package com.viromedia.bridge.component;


import android.content.Context;

import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReadableMap;
import com.viro.renderer.jni.BaseSoundJni;
import com.viro.renderer.jni.SoundFieldJni;

public class SoundField extends BaseSound {

    private static float[] DEFAULT_ROTATION = {0f,0f,0f};

    protected float[] mRotation = DEFAULT_ROTATION;

    public SoundField(ReactApplicationContext reactContext) {
        super(reactContext);
    }

    public SoundField(Context context) {
        super(context);
    }

    public void setRotation(float[] rotation) {
        mRotation = rotation == null ? DEFAULT_ROTATION : rotation;
    }

    @Override
    protected void setNativeProps() {
        super.setNativeProps();

        if (mNativeSound == null) {
            return;
        }

        mNativeSound.setRotation(mRotation);
    }

    @Override
    protected BaseSoundJni getNativeSound(String path, boolean local) {
        return new SoundFieldJni(path, mRenderContext, this, local);
    }
}