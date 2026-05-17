package com.mogkhang.lumi.shared

interface PlayerDelegate {
  fun onPropertyChange(name: String, value: Any?)
  fun onEvent(name: String, data: Map<String, Any>?)
}
