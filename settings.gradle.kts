rootProject.name = "logo"

includeBuild("geogebra") {
    dependencySubstitution {
        substitute(module("org.geogebra:common")).using(project(":common"))
    }
}
