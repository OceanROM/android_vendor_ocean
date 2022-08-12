#
# Copyright (C) 2010 The Android Open Source Project
# Copyright (C) 2016 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Makefile for producing ocean sdk coverage reports.
# Run "make ocean-sdk-test-coverage" in the $ANDROID_BUILD_TOP directory.

ocean_sdk_api_coverage_exe := $(HOST_OUT_EXECUTABLES)/ocean-sdk-api-coverage
dexdeps_exe := $(HOST_OUT_EXECUTABLES)/dexdeps

coverage_out := $(HOST_OUT)/ocean-sdk-api-coverage

api_text_description := ocean-sdk/api/ocean_current.txt
api_xml_description := $(coverage_out)/api.xml
$(api_xml_description) : $(api_text_description) $(APICHECK)
	$(hide) echo "Converting API file to XML: $@"
	$(hide) mkdir -p $(dir $@)
	$(hide) $(APICHECK_COMMAND) -convert2xml $< $@

ocean-sdk-test-coverage-report := $(coverage_out)/ocean-sdk-test-coverage.html

ocean_sdk_tests_apk := $(call intermediates-dir-for,APPS,oceanPlatformTests)/package.apk
oceansettingsprovider_tests_apk := $(call intermediates-dir-for,APPS,oceanSettingsProviderTests)/package.apk
ocean_sdk_api_coverage_dependencies := $(ocean_sdk_api_coverage_exe) $(dexdeps_exe) $(api_xml_description)

$(ocean-sdk-test-coverage-report): PRIVATE_TEST_CASES := $(ocean_sdk_tests_apk) $(oceansettingsprovider_tests_apk)
$(ocean-sdk-test-coverage-report): PRIVATE_ocean_SDK_API_COVERAGE_EXE := $(ocean_sdk_api_coverage_exe)
$(ocean-sdk-test-coverage-report): PRIVATE_DEXDEPS_EXE := $(dexdeps_exe)
$(ocean-sdk-test-coverage-report): PRIVATE_API_XML_DESC := $(api_xml_description)
$(ocean-sdk-test-coverage-report): $(ocean_sdk_tests_apk) $(oceansettingsprovider_tests_apk) $(ocean_sdk_api_coverage_dependencies) | $(ACP)
	$(call generate-ocean-coverage-report,"ocean-SDK API Coverage Report",\
			$(PRIVATE_TEST_CASES),html)

.PHONY: ocean-sdk-test-coverage
ocean-sdk-test-coverage : $(ocean-sdk-test-coverage-report)

# Put the test coverage report in the dist dir if "ocean-sdk" is among the build goals.
ifneq ($(filter ocean-sdk, $(MAKECMDGOALS)),)
  $(call dist-for-goals, ocean-sdk, $(ocean-sdk-test-coverage-report):ocean-sdk-test-coverage-report.html)
endif

# Arguments;
#  1 - Name of the report printed out on the screen
#  2 - List of apk files that will be scanned to generate the report
#  3 - Format of the report
define generate-ocean-coverage-report
	$(hide) mkdir -p $(dir $@)
	$(hide) $(PRIVATE_ocean_SDK_API_COVERAGE_EXE) -d $(PRIVATE_DEXDEPS_EXE) -a $(PRIVATE_API_XML_DESC) -f $(3) -o $@ $(2) -cm
	@ echo $(1): file://$@
endef

# Reset temp vars
ocean_sdk_api_coverage_dependencies :=
ocean-sdk-combined-coverage-report :=
ocean-sdk-combined-xml-coverage-report :=
ocean-sdk-verifier-coverage-report :=
ocean-sdk-test-coverage-report :=
api_xml_description :=
api_text_description :=
coverage_out :=
dexdeps_exe :=
ocean_sdk_api_coverage_exe :=
ocean_sdk_verifier_apk :=
android_ocean_sdk_zip :=
