rootProject.name = "logo"

includeBuild("geogebra") {
    dependencySubstitution {
        substitute(module("org.geogebra:common")).using(project(":common"))
        substitute(module("org.geogebra:common-jre")).using(project(":common-jre"))
        substitute(module("org.geogebra:desktop")).using(project(":desktop"))
    }
}
