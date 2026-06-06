# R8 missing-class warnings for transitive dependencies that reference
# optional/absent classes. These are safe to suppress — the referenced
# resource classes are not present at runtime on this build flavor.
# Generated originally by AGP into missing_rules.txt.
-dontwarn com.google.android.gms.common.R$string
-dontwarn io.sentry.android.core.R$drawable
-dontwarn io.sentry.android.core.R$id
-dontwarn io.sentry.android.core.R$layout
-dontwarn io.sentry.android.core.R$styleable
-dontwarn io.sentry.android.replay.R$id
