package foundation.esoteric.logo

import org.geogebra.desktop.GeoGebra
import org.geogebra.desktop.export.GraphicExportDialog
import org.geogebra.desktop.gui.app.GeoGebraFrame
import java.io.File

fun main() {
    Thread {
        GeoGebra.main(emptyArray())
    }.start()

    var frame: GeoGebraFrame? = null

    while (frame == null) {
        frame = GeoGebraFrame.getActiveInstance()
    }

    val logoFile = File("./esoteric-foundation-logo.ggb")
    val outputFile = File("./esoteric-foundation-logo.svg")

    val desktopApp = frame.application

    desktopApp.loadFile(logoFile, false)

    GraphicExportDialog.exportSVG(
        desktopApp,
        desktopApp.activeEuclidianView,
        outputFile,
        false,
        500,
        500,
        1.0,
        1.0,
        1.0,
        true
    )

    desktopApp.exit()
}
