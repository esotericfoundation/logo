package foundation.esoteric.logo

import org.geogebra.desktop.GeoGebra
import org.geogebra.desktop.gui.app.GeoGebraFrame
import java.io.File

fun main() {
    val mainThread = Thread {
        GeoGebra.main(emptyArray())
    }.start()

    var frame: GeoGebraFrame? = null

    while (frame == null) {
        frame = GeoGebraFrame.getActiveInstance()
    }

    val logoFile = File("./esoteric-foundation-logo.ggb")

    val desktopApp = frame.application

    desktopApp.loadFile(logoFile, false)

    val gui = desktopApp.guiManager

    gui.showGraphicExport()
}
