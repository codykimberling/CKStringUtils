#!/bin/bash

appledoc \
--project-name CKStringUtils \
--project-company "Cody Kimberling" \
--company-id com.codykimberling \
--keep-undocumented-objects \
--keep-undocumented-members \
--search-undocumented-doc \
--exit-threshold 2 \
--ignore .m \
--ignore CKAppDelegate.h \
--output "AppleDoc" .