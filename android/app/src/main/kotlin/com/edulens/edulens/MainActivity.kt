package com.edulens.edulens

import io.flutter.embedding.android.FlutterActivity

//import android.R
//import android.os.Build
//import android.os.Bundle
//import android.util.Log
//import android.view.SurfaceView
//import android.view.View
//import android.view.ViewGroup
//import android.view.WindowManager
//import io.flutter.BuildConfig
//import io.flutter.embedding.android.FlutterActivity

class MainActivity: FlutterActivity() {

//    override fun onCreate(savedInstanceState: Bundle?) {
//
//        super.onCreate(savedInstanceState)
//        var originalStatusBarColor = 0
//        originalStatusBarColor = window.statusBarColor
//        window.statusBarColor = 0xffeaeaea.toInt()
//        originalStatusBarColor
//
//
//        if (!setSecureSurfaceView()) {
//
//            Log.e("MainActivity", "Could not secure the MainActivity!")
//            // React as appropriate.
//        }
//        if(!BuildConfig.DEBUG) {
//            window.addFlags(WindowManager.LayoutParams.FLAG_SECURE)
//            window.setFlags(
//                WindowManager.LayoutParams.FLAG_SECURE,
//                WindowManager.LayoutParams.FLAG_SECURE)
//            SurfaceView(applicationContext).setSecure(true)
//        }
//    }
//    private fun setSecureSurfaceView(): Boolean {
//        val content = findViewById<ViewGroup>(R.id.content)
//        if (!isNonEmptyContainer(content)) {
//            return false
//        }
//        val splashView = content.getChildAt(0)
//        if (!isNonEmptyContainer(splashView)) {
//            return false
//        }
//        val flutterView = (splashView as ViewGroup).getChildAt(0)
//        if (!isNonEmptyContainer(flutterView)) {
//            return false
//        }
//        val surfaceView = (flutterView as ViewGroup).getChildAt(0)
//        if (surfaceView !is SurfaceView) {
//            return false
//        }
//        surfaceView.setSecure(true)
//        this.window.setFlags(WindowManager.LayoutParams.FLAG_SECURE, WindowManager.LayoutParams.FLAG_SECURE)
//        return true
//    }
//
//    private fun isNonEmptyContainer(view: View): Boolean {
//        if (view !is ViewGroup) {
//            return false
//        }
//        if (view.childCount < 1) {
//            return false
//        }
//        return true
//    }

}


