pragma Singleton

import Quickshell
import QtQuick

Singleton {
  id: root

  property bool showUtc: false

  readonly property string timeString: {
    if (showUtc) {
      let d = clock.date
      let h = String(d.getUTCHours()).padStart(2, '0')
      let m = String(d.getUTCMinutes()).padStart(2, '0')
      return h + ":" + m + " UTC"
    } else {
      return Qt.formatDateTime(clock.date, "hh:mm")
    }
  }

  readonly property string dateString: {
    if (showUtc) {
      // build a UTC-shifted Date so day/month/year roll over correctly
      // near midnight, then format normally
      let d = clock.date
      let utcShifted = new Date(d.getTime() + d.getTimezoneOffset() * 60000)
      return Qt.formatDateTime(utcShifted, "MMM d")
    } else {
      return Qt.formatDateTime(clock.date, "MMM d")
    }
  }

  function toggleTimezone() {
    showUtc = !showUtc
  }

  SystemClock {
    id: clock
    precision: SystemClock.Seconds
  }
}
