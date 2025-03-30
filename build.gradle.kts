plugins {
    application // Adds support for building a CLI application.

    alias(libs.plugins.kotlin.jvm)
}

repositories {
    mavenCentral()

    maven("https://repo.geogebra.net/releases")
}
