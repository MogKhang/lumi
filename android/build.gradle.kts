// Force a newer standalone R8 onto the build classpath. AGP 8.9.1 ships an R8
// that predates Kotlin 2.1.0's metadata format, which makes Android Studio
// report "an error occurred when parsing kotlin metadata" on release builds.
// Pinning R8 here (the root build script — the only legal place for a
// classpath override) resolves the version mismatch. AGP/Kotlin unchanged.
buildscript {
    repositories {
        mavenCentral()
        google()
    }
    dependencies {
        classpath("com.android.tools:r8:8.7.18")
    }
}

allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

val newBuildDir: Directory = rootProject.layout.buildDirectory.dir("../../build").get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}
subprojects {
    project.evaluationDependsOn(":app")
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
