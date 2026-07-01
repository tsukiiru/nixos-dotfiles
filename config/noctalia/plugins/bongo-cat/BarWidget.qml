import QtQuick
import QtQuick.Layouts
import Quickshell
import qs.Commons
import qs.Widgets

Item {
  id: root

  // Plugin API (injected by PluginService)
  property var pluginApi: null
  readonly property string screenName: screen?.name ?? ""
  readonly property string barPosition: Settings.getBarPositionForScreen(screenName)
  readonly property bool barIsVertical: barPosition === "left" || barPosition === "right"
  readonly property real capsuleHeight: Style.getCapsuleHeightForScreen(screenName)

  property color colorBg: Color.mSurfaceVariant

  // Required properties for bar widgets
  property ShellScreen screen
  property string widgetId: ""
  property string section: ""
  readonly property real contentWidth: barIsVertical ? capsuleHeight : Math.round(capsuleHeight + Style.marginXS * 3)
  readonly property real contentHeight: capsuleHeight

  implicitWidth: contentWidth
  implicitHeight: contentHeight

  Rectangle {
    id: visualCapsule
    x: Style.pixelAlignCenter(parent.width, width)
    y: Style.pixelAlignCenter(parent.height, height)
    width: root.contentWidth
    height: root.contentHeight 
    color: Style.capsuleColor
    opacity: Style.opacityFull
    border.color: Style.capsuleBorderColor
    border.width: Style.capsuleBorderWidth
    radius: Style.radiusM
    
    Image {
      id: bongoCat
      source: Qt.resolvedUrl("assets/bongo-cat-up.svg")
      x: Style.pixelAlignCenter(parent.width, width)
      y: Style.pixelAlignCenter(parent.height, height)

      width: Style.toOdd(visualCapsule.width)
      height: width

      sourceSize: Qt.size(width, height)
      fillMode: Image.PreserveAspectFit
      smooth: true
      mipmap: false

    }
  }
}
