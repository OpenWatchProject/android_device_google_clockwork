-include sdk/build/product_sdk.mk
-include development/build/product_sdk.mk

DEVICE_PACKAGE_OVERLAYS += device/google/clockwork/overlay

$(call inherit-product, frameworks/base/data/sounds/AllAudio.mk)
$(call inherit-product, frameworks/base/data/fonts/fonts.mk)
$(call inherit-product, frameworks/base/data/keyboards/keyboards.mk)
$(call inherit-product, external/roboto-fonts/fonts.mk)
$(call inherit-product, external/noto-fonts/fonts.mk)
$(call inherit-product, external/hyphenation-patterns/patterns.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_tiny.mk)

# Limited public lib list for wear
PRODUCT_COPY_FILES += \
    system/core/rootdir/etc/public.libraries.wear.txt:system/etc/public.libraries.txt

# Extra framework bits
PRODUCT_PACKAGES += \
    librs_jni \
    vibrator.default

# System tools
PRODUCT_PACKAGES += \
    screenrecord

# Bluetooth proxy
PRODUCT_PACKAGES += \
    sysproxy \
    sysproxyd

# Support Runtime Resource Overlay
PRODUCT_PACKAGES += \
    idmap

# Multi DNS introduced API 16
PRODUCT_PACKAGES += \
    mdnsd

# HIDL requirements
PRODUCT_PACKAGES += \
    hwservicemanager \
    android.hardware.configstore@1.0-impl \
    android.hardware.configstore@1.0-service \
    android.hidl.memory@1.0-service \
    android.hidl.memory@1.0-impl

# Misc required aosp apps
PRODUCT_PACKAGES += \
    DownloadProvider \
    KeyChain \
    MediaProvider \
    StatementService \
    UserDictionaryProvider

# Telecom stuff needed for misc functions
PRODUCT_PACKAGES += \
    CellBroadcastReceiver \
    Telecom \
    BlockedNumberProvider \
    ManagedProvisioning

# software media codecs
PRODUCT_PACKAGES += \
    libstagefright_soft_mp3dec \
    libstagefright_soft_aacdec \
    libstagefright_soft_amrdec \
    libstagefright_soft_g711dec \
    libstagefright_soft_mp3dec \
    libstagefright_soft_opusdec \
    libstagefright_soft_rawdec \
    libstagefright_soft_vorbisdec

# Low ram/Low Power
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.low_ram=true \
    dalvik.vm.dex2oat-threads=4 \

# Bluetooth
PRODUCT_PROPERTY_OVERRIDES += \
    ro.bluetooth.hfp.ver=1.6 \
    bluetooth.force_pm_timer=2000 \

# Disable adb prompt
PRODUCT_PROPERTY_OVERRIDES += \
    persist.adb.notify=0 \

# Small display photo size
PRODUCT_PROPERTY_OVERRIDES += \
    contacts.display_photo_size=200 \

# 8 apps in the background
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.max_starting_bg=8

# Disable aosp system services
PRODUCT_PROPERTY_OVERRIDES += \
    config.disable_systemui=true \
    config.disable_rtt=true \
    config.disable_mediaproj=true \
    config.disable_networktime=true \
    config.disable_serial=true \
    config.disable_searchmanager=true \
    config.disable_textservices=false \
    config.disable_samplingprof=true \
    config.disable_consumerir=true \
    config.disable_vrmanager=true \
    config.disable_cameraservice=true

# All support wear locales
PRODUCT_LOCALES := en_US en_GB en_XA cs_CZ da_DK de_DE es_ES es_US es_419 fi_FI fr_FR fr_CA hi_IN in_ID it_IT ja_JP ko_KR nb_NO nl nl_BE pl pt_BR pt_PT ru_RU sv_SE th tr_TR vi_VN zh_HK zh_TW

# 512mb dalvik heap
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.heapstartsize=5m \
    dalvik.vm.heapgrowthlimit=48m \
    dalvik.vm.heapsize=128m \
    dalvik.vm.heaptargetutilization=0.75 \
    dalvik.vm.heapminfree=512k \
    dalvik.vm.heapmaxfree=2m