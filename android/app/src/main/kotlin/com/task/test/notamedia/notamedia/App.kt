package com.task.test.notamedia.notamedia

import androidx.annotation.CallSuper
import com.yandex.mapkit.MapKitFactory
import io.flutter.app.FlutterApplication


class App : FlutterApplication() {
    @CallSuper
    override fun onCreate() {
        super.onCreate()
        MapKitFactory.setApiKey("103ad186-8961-4064-b84d-85b240017883")
    }
}